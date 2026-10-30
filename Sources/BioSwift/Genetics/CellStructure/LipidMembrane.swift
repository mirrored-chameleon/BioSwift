//
//  LipidMembrane.swift
//  BioSwift
//
//  Created by Davyn Monagle on 30/10/2026.
//

import Foundation

/// Models a cellular lipid bilayer membrane, tracking capacitance, surface parameters, and electrical potentials.
public struct LipidMembrane: Codable {
    /// The physical surface area of the cell membrane in square micrometers (µm²).
    public var surfaceArea: Double
    
    /// Specific membrane capacitance, typically standardized to ~1.0 µF/cm² in biophysics.
    public var specificCapacitance: Double
    
    /// The current electrical potential across the membrane in millivolts (mV).
    public var membranePotential: Double
    
    /// Total electrical capacitance calculated from surface area and specific capacitance properties.
    public var totalCapacitance: Double {
        // Convert µm² to cm² to match standard capacitance scaling laws
        let surfaceAreaInCm2 = surfaceArea * 1e-8
        return specificCapacitance * surfaceAreaInCm2
    }
    
    /// Initialises a new type-safe biological lipid membrane.
    /// - Parameters:
    ///   - surfaceArea: Surface area of the cell in µm². Defaults to a standard 1500.0.
    ///   - specificCapacitance: Capacitance per unit area. Defaults to 1.0 µF/cm².
    ///   - restingPotential: Intended baseline voltage in mV. Defaults to a standard resting potential of -70.0 mV.
    public init(surfaceArea: Double = 1500.0, specificCapacitance: Double = 1.0, restingPotential: Double = -70.0) {
        self.surfaceArea = surfaceArea
        self.specificCapacitance = specificCapacitance
        self.membranePotential = restingPotential
    }
    
    /// Integrates net ion currents over a small time increment to update the membrane voltage state.
    /// Uses the fundamental biophysical differential equation: dV/dt = I / C
    /// - Parameters:
    ///   - sodiumCurrent: Influx/efflux of Na+ ions in picoamperes (pA).
    ///   - potassiumCurrent: Influx/efflux of K+ ions in picoamperes (pA).
    ///   - leakageCurrent: Non-specific background current in picoamperes (pA).
    ///   - timeStep: The delta time increment of the simulation step in seconds (s).
    public mutating func integrateIonCurrents(sodiumCurrent: Double, potassiumCurrent: Double, leakageCurrent: Double, timeStep: Double) {
        let totalNetCurrent = sodiumCurrent + potassiumCurrent + leakageCurrent
        
        // Safety check to ensure we never divide by zero on undefined membrane scales
        guard totalCapacitance > 0 else { return }
        
        // Calculate the derivative: change in voltage over change in time
        let deltaVoltage = (totalNetCurrent / totalCapacitance) * timeStep
        
        // Step forward the tracking potential
        self.membranePotential += deltaVoltage
    }
}

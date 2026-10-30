//
//  Mitochondrion.swift
//  BioSwift
//
//  Created by Davyn Monagle on 30/10/2026.
//

import Foundation

/// A metabolic organelle responsible for ATP asset generation and consumption tracking.
public class Mitochondrion: Organelle, Codable {
    public let id: UUID
    public var description: String { "Mitochondrion (ATP Factory)" }
    
    /// Current pool of available Adenosine Triphosphate (ATP) units inside the cell.
    public private(set) var atpStorage: Double
    public let maxCapacity: Double
    public var respirationRate: Double
    
    public init(initialATP: Double = 100.0, maxCapacity: Double = 100.0, respirationRate: Double = 0.8) {
        self.atpStorage = initialATP
        self.maxCapacity = maxCapacity
        self.respirationRate = respirationRate
        self.id = UUID()
    }
    
    /// Protocol conformance: Automatically runs on the simulation tick to synthesize fresh energy.
    public func update(timeStep: Double) {
        let generatedEnergy = respirationRate * timeStep
        atpStorage = min(maxCapacity, atpStorage + generatedEnergy)
    }
    
    /// Withdraws a dedicated amount of ATP to power active cellular operations.
    public func consumeEnergy(amount: Double) -> Bool {
        guard atpStorage >= amount else {
            atpStorage = 0.0
            return false
        }
        atpStorage -= amount
        return true
    }
}

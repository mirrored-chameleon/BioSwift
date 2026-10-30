//
//  DrumCell.swift
//  BioSwift
//
//  Created by Davyn Monagle on 30/10/2026.
//

import Foundation

/// Defines the structural voice mapping for our specialised 4-cell percussion array.
public enum DrumVoice: Int, CaseIterable, Codable {
    case kick = 0
    case snare = 1
    case hiHat = 2
    case synthBass = 3
}

public class DrumCell {
    public let id = UUID()
    public let voice: DrumVoice
    
    // Core physical membranes and metabolic power grids
    public var membrane: LipidMembrane
    public var organelles: [Organelle] = []
    public let powerhouse: Mitochondrion
    public let controlCenter: Nucleus
    
    // Realistic protein-coded ion gates from your EssentialProteins registry
    public var sodiumGate: SodiumChannelProtein
    public var potassiumGate: PotassiumChannelProtein
    
    /// Tracks mechanical structural compression for audio engine velocity mapping
    public private(set) var structuralContractionIntensity: Double = 0.0
    
    public init(voice: DrumVoice, dnaBlueprint: DNASequence) {
        self.voice = voice
        
        // 1. Initialise core biophysics boundaries with localized parameters
        self.membrane = LipidMembrane(surfaceArea: 1600.0, specificCapacitance: 1.0, restingPotential: -70.0)
        self.powerhouse = Mitochondrion(initialATP: 100.0, maxCapacity: 100.0, respirationRate: 1.5)
        self.controlCenter = Nucleus(blueprint: dnaBlueprint)
        
        self.organelles = [powerhouse, controlCenter]
        controlCenter.expressGenes()
        
        // 2. Instantiate and inject real, type-safe protein chains into the channel gates
        let expressedAcids = controlCenter.expressibleProteins
        self.sodiumGate = SodiumChannelProtein(geneSourceID: "GENE-NA-\(voice)", aminoAcidChain: expressedAcids)
        self.potassiumGate = PotassiumChannelProtein(geneSourceID: "GENE-K-\(voice)", aminoAcidChain: expressedAcids)
    }
    
    /// Drives the biological state timeline loop for this specific cell voice node
    public func simulationStep(timeStep: Double) {
        // Update metabolic assets across internal organelles
        for organelle in organelles {
            organelle.update(timeStep: timeStep)
        }
        
        var sodiumCurrent = 0.0
        var potassiumCurrent = 0.0
        let leakageCurrent = -1.2 // Baseline background leak in pA to maintain rest states
        
        // Check if mitochondrion has enough ATP assets to cycle active transport loops
        let hasMetabolicPower = powerhouse.consumeEnergy(amount: 0.08 * timeStep)
        
        if hasMetabolicPower {
            let currentVoltage = membrane.membranePotential
            
            // --- Realistic Hodgkin-Huxley Ion Gate Switching ---
            // Sodium Channel opens rapidly upon hitting threshold voltage (-50mV)
            if currentVoltage > -50.0 && currentVoltage < 30.0 {
                sodiumGate.isOpen = true
                // Scale influx directly based on your library's calculated molecular weight properties!
                let massModifier = (sodiumGate.molecularWeight ?? 1000.0) / 1000.0
                sodiumCurrent += 85.0 * massModifier
            } else {
                sodiumGate.isOpen = false
            }
            
            // Potassium Channel opens delayed at higher positive values to repolarise
            if currentVoltage > 10.0 {
                potassiumGate.isOpen = true
                let massModifier = (potassiumGate.molecularWeight ?? 1000.0) / 1000.0
                potassiumCurrent -= 95.0 * massModifier
            } else {
                potassiumGate.isOpen = false
            }
            
            // --- Map Biophysics State straight to Structural Sound Mechanics ---
            updateMechanicalDeformation(timeStep: timeStep)
            
        } else {
            // Starvation event: ion gates freeze closed and potentials slowly decay to equilibrium
            sodiumGate.isOpen = false
            potassiumGate.isOpen = false
            structuralContractionIntensity = max(0.0, structuralContractionIntensity - (timeStep * 5.0))
        }
        
        // Integrate net atomic vector charges back down to the lipid membrane capacitor loop
        membrane.integrateIonCurrents(
            sodiumCurrent: sodiumCurrent,
            potassiumCurrent: potassiumCurrent,
            leakageCurrent: leakageCurrent,
            timeStep: timeStep
        )
    }
    
    private func updateMechanicalDeformation(timeStep: Double) {
        switch voice {
        case .kick:
            // The Kick voice responds directly to the peak intensity of the Sodium influx wave
            if sodiumGate.isOpen {
                structuralContractionIntensity = min(1.0, structuralContractionIntensity + (timeStep * 25.0))
            } else {
                structuralContractionIntensity = max(0.0, structuralContractionIntensity - (timeStep * 8.0))
            }
        case .snare:
            // The Snare voice responds directly to the Potassium efflux flash crash
            if potassiumGate.isOpen {
                structuralContractionIntensity = min(1.0, structuralContractionIntensity + (timeStep * 30.0))
            } else {
                structuralContractionIntensity = max(0.0, structuralContractionIntensity - (timeStep * 12.0))
            }
        case .hiHat, .synthBass:
            // Background rhythm tracks respond to local overall membrane potential volatility
            if membrane.membranePotential > -40.0 {
                structuralContractionIntensity = min(1.0, structuralContractionIntensity + (timeStep * 15.0))
            } else {
                structuralContractionIntensity = max(0.0, structuralContractionIntensity - (timeStep * 6.0))
            }
        }
    }
}


/// Manages the collective 4-cell drum organ matrix array inside your CellSimulation folder
public class DrumTissueSimulationArray {
    public var cellCluster: [DrumCell] = []
    
    public init() {
        // Seed each specialised voice with distinct string literals using your DNA parser
        let blueprints: [DrumVoice: DNASequence] = [
            .kick: "atggctcgtaatgactgccatattccgaaatgggtatagaa",
            .snare: "atggccgctagctagctagctagcctagctagctagtag",
            .hiHat: "atgcgtacgtacgtacgtacgtacgtacgtacgtacgtag",
            .synthBass: "atgggaaaaccctttggguuucccaaatttgggtttaa"
        ]
        
        for voice in DrumVoice.allCases {
            if let dna = blueprints[voice] {
                let cell = DrumCell(voice: voice, dnaBlueprint: dna)
                cellCluster.append(cell)
            }
        }
    }
    
    /// Drives the master tick across all 4 percussion cells simultaneously
    public func tickArray(timeStep: Double, audioBridge: (DrumVoice, Double) -> Void) {
        for cell in cellCluster {
            let previousContraction = cell.structuralContractionIntensity
            cell.simulationStep(timeStep: timeStep)
            
            // If the cell hits an active peak surge, trigger the sound voice event instantly
            if cell.structuralContractionIntensity > 0.8 && previousContraction <= 0.8 {
                // Pass the voice type and its current biological asset volume (velocity)
                audioBridge(cell.voice, cell.structuralContractionIntensity)
            }
        }
    }
}

//
//  Nucleus.swift
//  BioSwift
//
//  Created by Davyn Monagle on 30/10/2026.
//

import Foundation

/// The cellular command center responsible for housing genomic strands and managing protein transcription.
public class Nucleus: Organelle {
    public let id = UUID()
    public var description: String { "Nucleus (Genomic Control)" }
    
    /// The master DNA sequence blueprint stored securely inside the nuclear envelope.
    public var dnaBlueprint: DNASequence
    
    /// Caches the most recently synthesized amino acid chain ready for cell distribution.
    public private(set) var expressibleProteins: [AminoAcid] = []
    
    public init(blueprint: DNASequence) {
        self.dnaBlueprint = blueprint
    }
    
    /// Protocol conformance: Runs processing checks on the nuclear state over time.
    public func update(timeStep: Double) {
        // Standard structural maintenance loops go here
    }
    
    /// Commands the nucleus to run a complete transcription and translation workflow.
    /// Utilises your high-performance native string conversion layers under the hood!
    public func expressGenes() {
        let rnaStrand = dnaBlueprint.transcribe()
        self.expressibleProteins = rnaStrand.findAminoAcid()
    }
}

//
//  EssentialProteins.swift
//  BioSwift
//
//  Created by Davyn Monagle on 29/10/2026.
//

//
//  EssentialProteins.swift
//  BioSwift
//
//  Created by Davyn Monagle on 29/10/2026.
//

import Foundation

/// 1. Concrete implementation of your custom Protein protocol for a Sodium Channel gate.
public class SodiumChannelProtein: Protein {
    // Required fields by your Protein protocol
    public let id = UUID()
    public let geneSourceID: String
    public let aminoAcidChain: [AminoAcid]
    public var molecularWeight: Double?
    public var isoelectricPoint: Double? = nil
    public var hydrophobicRatio: Double? = nil
    
    public var isOpen: Bool = false
    
    public init(geneSourceID: String, aminoAcidChain: [AminoAcid]) {
        self.geneSourceID = geneSourceID
        self.aminoAcidChain = aminoAcidChain
        
        self.molecularWeight = aminoAcidChain.reduce(0.0) { $0 + $1.monoisotopicMass }
    }
}

public class PotassiumChannelProtein: Protein {
    public let id = UUID()
    public let geneSourceID: String
    public let aminoAcidChain: [AminoAcid]
    public var molecularWeight: Double?
    public var isoelectricPoint: Double? = nil
    public var hydrophobicRatio: Double? = nil
    
    public var isOpen: Bool = false
    
    public init(geneSourceID: String, aminoAcidChain: [AminoAcid]) {
        self.geneSourceID = geneSourceID
        self.aminoAcidChain = aminoAcidChain
        self.molecularWeight = aminoAcidChain.reduce(0.0) { $0 + $1.monoisotopicMass }
    }
}

public class GlutamateReceptorProtein: Protein {
    public let id = UUID()
    public let geneSourceID: String
    public let aminoAcidChain: [AminoAcid]
    public var molecularWeight: Double?
    public var isoelectricPoint: Double? = nil
    public var hydrophobicRatio: Double? = nil
    
    public var isOpen: Bool = false
    
    public init(geneSourceID: String, aminoAcidChain: [AminoAcid]) {
        self.geneSourceID = geneSourceID
        self.aminoAcidChain = aminoAcidChain
        self.molecularWeight = aminoAcidChain.reduce(0.0) { $0 + $1.monoisotopicMass }
    }
}

public class GABAReceptorProtein: Protein {
    public let id = UUID()
    public let geneSourceID: String
    public let aminoAcidChain: [AminoAcid]
    public var molecularWeight: Double?
    public var isoelectricPoint: Double? = nil
    public var hydrophobicRatio: Double? = nil
    
    public var isOpen: Bool = false
    
    public init(geneSourceID: String, aminoAcidChain: [AminoAcid]) {
        self.geneSourceID = geneSourceID
        self.aminoAcidChain = aminoAcidChain
        self.molecularWeight = aminoAcidChain.reduce(0.0) { $0 + $1.monoisotopicMass }
    }
}

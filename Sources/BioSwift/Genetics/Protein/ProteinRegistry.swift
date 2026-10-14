//
//  ProteinRegistry.swift
//  BioSwift
//
//  Created by Davyn Monagle on 14/10/2026.
//

protocol Protein {
    var id: UUID { get }
    var geneSourceID: String { get }
    var aminoAcidChain: [RNANucleotide] { get }

    var molecularWeight: Double { get }
    var isoelectricPoint: Double { get }
    var hydrophobicRatio: Double { get }
}

class ProteinRegistry {
    public static let shared = ProteinRegistry()

    private init() {}

    private var genomeMap: [String : String] = [:]
    private var proteinMetadata: [String : String] = [:]

    public func registerGene(id: String, dnaStrand: String, proteinName: String) {
        genomeMap[id] = dnaStrand.uppercased()
        proteinMetadata[id] = proteinName
    }

    public func fetchGene(id: String) -> String? {
        return genomeMap[id]
    }

    public func fetchProteinName(forGene id: String) -> String? {
        return proteinMetadata[id]
    }
}
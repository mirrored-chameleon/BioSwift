//
//  rna.swift
//  BioSwift
//
//  Created by Davyn Monagle on 21/9/2026.
//

/// The 4 standard RNA nucleotide bases with strict type safety
public enum RNANucleotide: Character, CaseIterable, Codable {
    case adenine = "A"
    case cytosine = "C"
    case guanine = "G"
    case uracil = "U"
}


/// A structure to store a RNA sequence, and to manipulate and store data about it.
public struct RNASequence {
    
    /// All the bases the `RNASequence` stores.
    public let bases: [RNANucleotide]
    
    /// Initialises the `RNASequence` with a string.
    public init(bases: String) {
        self.bases = bases.uppercased().compactMap { RNANucleotide(rawValue: $0) }
    }
}

extension RNASequence: ExpressibleByStringLiteral {
    /// Allows a RNASequence to be created directly from a raw string literal.
    /// Example: var strand: RNASequence = "atcg"
    public init(stringLiteral value: String) {
        self.init(bases: value)
    }
}

//
//  dna.swift
//  BioSwift
//
//  Created by Davyn Monagle on 21/9/2026.
//


/// The 4 standard DNA nucleotide bases with strict type safety
public enum Nucleotide: Character, CaseIterable, Codable {
    case adenine = "A"
    case cytosine = "C"
    case guanine = "G"
    case thymine = "T"
}


/// A structure to store a DNA sequence, and to manipulate and store data about it.
public struct DNASequence {
    
    /// All the bases the `DNASequence` stores.
    public let bases: [Nucleotide]
    
    /// Initialises the `DNASequence` with a string.
    public init(bases: String) {
        self.bases = bases.uppercased().compactMap { Nucleotide(rawValue: $0) }
    }
    
    /// A variable the calculates the GC Content of a `DNASequence`.
    public var gcContent: Double {
        guard !bases.isEmpty else { return 0.0 }
        
        let gcCount = bases.filter { base in
            base == .guanine || base == .cytosine
        }.count
        
        return (Double(gcCount) / Double(bases.count)) * 100
    }
}

extension DNASequence: ExpressibleByStringLiteral {
    /// Allows a DNASequence to be created directly from a raw string literal.
    /// Example: var strand: DNASequence = "atcg"
    public init(stringLiteral value: String) {
        self.init(bases: value)
    }
}

extension DNASequence {
    public func transcribe() -> RNASequence {
        let rnaBases = self.bases.map { dnaBase -> RNANucleotide in
            switch dnaBase {
            case .adenine: return .adenine
            case .cytosine: return .cytosine
            case .guanine: return .guanine
            case .thymine: return .uracil
            }
        }
    
        let rnaString = String(rnaBases.map {$0.rawValue })
        return RNASequence(bases: rnaString)
    }
}

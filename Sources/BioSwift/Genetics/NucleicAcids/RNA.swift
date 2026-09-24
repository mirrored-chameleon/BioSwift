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

extension RNASequence {
    public func findAminoAcid() -> [AminoAcid] {
        var proteins: [AminoAcid] = []
        let codons = generateCodons()
        for codon in codons {
            if let aminoAcid = matchCodon(codon) {
                if aminoAcid == .stop {
                    break
                }
                proteins.append(aminoAcid)
            }
        }
        return proteins
    }
    
    private func generateCodons() -> [String] {
        var codonStrings: [String] = []
        let endBoundary = bases.count - 2
        for base in stride(from: 0, to: endBoundary, by: 3) {
            let triplet = "\(bases[base].rawValue)\(bases[base+1].rawValue)\(bases[base+2].rawValue)"
            codonStrings.append(triplet)
        }
        return codonStrings
    }
    
    private func matchCodon(_ codon: String) -> AminoAcid? {
        switch codon {
        case "GCU", "GCC", "GCA", "GCG":
            return .alanine
        case "CGU", "CGC", "CGA", "CGG", "AGA", "AGG":
            return .arginine
        case "AAU", "AAC":
            return .asparagine
        case "GAU", "GAC":
            return .asparticAcid
        case "UGU", "UGC":
            return .cysteine
        case "GAA", "GAG":
            return .glutamicAcid
        case "CAA", "CAG":
            return .glutamine
        case "GGU", "GGC", "GGA", "GGG":
            return .glycine
        case "CAU", "CAC":
            return .histidine
        case "AUU", "AUC", "AUA":
            return .isoleucine
        case "UUA", "UUG", "CUU", "CUC", "CUA", "CUG":
            return .leucine
        case "AAA", "AAG":
            return .lysine
        case "AUG":
            return .methionine
        case "UUU", "UUC":
            return .phenylalanine
        case "CCU", "CCC", "CCA", "CCG":
            return .proline
        case "UCU", "UCC", "UCA", "UCG", "AGU", "AGC":
            return .serine
        case "ACU", "ACC", "ACA", "ACG":
            return .threonine
        case "UGG":
            return .tryptophan
        case "UAU", "UAC":
            return .tyrosine
        case "GUU", "GUC", "GUA", "GUG":
            return .valine
        case "UAA", "UAG", "UGA":
            return .stop
        default:
            return nil
        }
    }
}

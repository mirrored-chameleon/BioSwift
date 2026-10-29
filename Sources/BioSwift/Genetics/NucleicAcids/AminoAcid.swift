//
//  AminoAcid.swift
//  BioSwift
//
//  Created by Davyn Monagle on 24/9/2026.
//

import Foundation

import Foundation

/// The 20 Standard Amino Acids plus an extra stop codon.
public enum AminoAcid: String, CaseIterable {
    case alanine
    case arginine
    case asparagine
    case asparticAcid
    case cysteine
    case glutamicAcid
    case glutamine
    case glycine
    case histidine
    case isoleucine
    case leucine
    case lysine
    case methionine
    case phenylalanine
    case proline
    case serine
    case threonine
    case tryptophan
    case tyrosine
    case valine
    case stop

    /// Stores the monoisotopic mass of each amino acid.
    public var monoisotopicMass: Double {
        switch self {
        case .alanine:       return 71.04
        case .arginine:      return 156.10
        case .asparagine:    return 114.04
        case .asparticAcid:  return 115.03
        case .cysteine:      return 103.01
        case .glutamicAcid:  return 129.04
        case .glutamine:     return 128.06
        case .glycine:       return 57.02
        case .histidine:     return 137.06
        case .isoleucine:    return 113.08
        case .leucine:       return 113.08
        case .lysine:        return 128.09
        case .methionine:    return 131.04
        case .phenylalanine: return 147.07
        case .proline:       return 97.05
        case .serine:        return 87.03
        case .threonine:     return 101.05
        case .tryptophan:    return 186.08
        case .tyrosine:      return 163.06
        case .valine:        return 99.07
        case .stop:          return 0.0
        }
    }
    
    /// Returns the clean common name for display or logging
    public var description: String {
        switch self {
        case .alanine:       return "Alanine"
        case .arginine:      return "Arginine"
        case .asparagine:    return "Asparagine"
        case .asparticAcid:  return "Aspartic Acid"
        case .cysteine:      return "Cysteine"
        case .glutamicAcid:  return "Glutamic Acid"
        case .glutamine:     return "Glutamine"
        case .glycine:       return "Glycine"
        case .histidine:     return "Histidine"
        case .isoleucine:    return "Isoleucine"
        case .leucine:       return "Leucine"
        case .lysine:        return "Lysine"
        case .methionine:    return "Methionine (Start)"
        case .phenylalanine: return "Phenylalanine"
        case .proline:       return "Proline"
        case .serine:        return "Serine"
        case .threonine:     return "Threonine"
        case .tryptophan:    return "Tryptophan"
        case .tyrosine:      return "Tyrosine"
        case .valine:        return "Valine"
        case .stop:          return "Stop Codon"
        }
    }
}

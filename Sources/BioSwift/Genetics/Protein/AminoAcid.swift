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

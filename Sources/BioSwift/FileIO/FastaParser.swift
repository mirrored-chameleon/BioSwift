//
//  FastaParser.swift
//  BioSwift
//
//  Created by Davyn Monagle on 25/9/2026.
//

import Foundation


/// Represents a single parsed record from a genetic FASTA file
struct FastaRecord {
    /// The metdada line inside of a FASTA file containing the description (e.g., ">NC_045512.2").
    public let header: String
    
    /// The valitated type safe DNA sequence.
    public let rawSequence: DNASequence
    
    /// Initializer tht converts the raw file text into a DNASequence
    public init(header: String, rawSequence: String) {
        self.header = header
        self.rawSequence = DNASequence(bases: rawSequence)
    }
}

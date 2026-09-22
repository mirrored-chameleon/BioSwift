//
//  rnaTests.swift
//  BioSwift
//
//  Created by Davyn Monagle on 21/9/2026.
//

import Testing

@testable import BioSwift

@Suite("RNA Tests")
struct RNATests {
    @Test("Valid uppercase strings parse perfectly into enums")
    func validStringParsing() async throws {
        let sequence = RNASequence(bases: "AUCG")
        
        #expect(sequence.bases.count == 4)
        #expect(sequence.bases == [.adenine, .uracil, .cytosine, .guanine])
    }
    
    @Test("Cleans out invalid RNA bases")
    func validRNAFiltering() async throws {
        let sequence = RNASequence(bases: "a u t x z g c")
        
        #expect(sequence.bases == [.adenine, .uracil, .guanine, .cytosine])
    }
    
    @Test("RNA Initialisation works")
    func initialiseRNA() async throws {
        let sequence: RNASequence = "aucg"
        
        #expect(sequence.bases == [.adenine, .uracil, .cytosine, .guanine])
    }
    @Test("Mutatable RNASequence")
    func testMutatability() async throws {
        var sequence: RNASequence = "aucg"
        sequence = "augc"
        
        #expect(sequence.bases == [.adenine, .uracil, .guanine, .cytosine])
    }
    
    @Test("RNA Transcription and Translation working")
    func testTranslation() async throws {
        let dna: DNASequence = "atgc"
        
        let rna = dna.transcribe()
        
        #expect(rna.bases == [.adenine, .uracil, .guanine, .cytosine])
    }
}

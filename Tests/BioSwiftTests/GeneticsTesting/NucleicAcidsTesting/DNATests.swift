//
//  dnaTests.swift
//  BioSwift
//
//  Created by Davyn Monagle on 21/9/2026.
//

import Testing

@testable import BioSwift

@Suite("DNA Tests")
struct DNATests {
    @Test("Valid uppercase strings parse perfectly into enums")
    func validStringParsing() async throws {
        let sequence = DNASequence(bases: "ATCG")
        
        #expect(sequence.bases.count == 4)
        #expect(sequence.bases == [.adenine, .thymine, .cytosine, .guanine])
    }
    
    @Test("Cleans out invalid DNA bases")
    func validDNAFiltering() async throws {
        let sequence = DNASequence(bases: "a t x z g c")
        
        #expect(sequence.bases == [.adenine, .thymine, .guanine, .cytosine])
    }
    
    @Test("GC-Content calculates properly")
    func validGCContentPredction() async throws {
        let sequence = DNASequence(bases: "atgc")
        
        #expect(sequence.gcContent == 50.0)
    }
    
    @Test("DNA Initialisation works")
    func initialiseDNA() async throws {
        let sequence: DNASequence = "atcg"
        
        #expect(sequence.bases == [.adenine, .thymine, .cytosine, .guanine])
    }
    @Test("Mutatable DNASequence")
    func testMutatability() async throws {
        var sequence: DNASequence = "atcg"
        sequence = "atgc"
        
        #expect(sequence.bases == [.adenine, .thymine, .guanine, .cytosine])
    }
}

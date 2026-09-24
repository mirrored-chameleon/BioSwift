//
//  proteinTests.swift
//  BioSwift
//
//  Created by Davyn Monagle on 24/9/2026.
//

import Testing

@testable import BioSwift

@Suite("Amino Acid Tests")
struct AminoAcidTests {
    @Test("DNA to RNA to Amino Acid flow working")
    func testFlow() {
        let dna: DNASequence = "atgcaaataactg"
        let rna = dna.transcribe()
        let acids = rna.findAminoAcid()
        
        #expect(acids == [.methionine, .glutamine, .tyrosine, .stop])
    }
}

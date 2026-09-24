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
        let dna: DNASequence = "atggctcgtaatgactgccatattccgaaatgggtatagaa"
        let rna = dna.transcribe()
        let acids = rna.findAminoAcid()
        
        #expect(acids == [.methionine, .alanine, .arginine, .asparagine, .asparticAcid, .cysteine, .histidine, .isoleucine, .proline, .lysine, .tryptophan, .valine])
    }
}

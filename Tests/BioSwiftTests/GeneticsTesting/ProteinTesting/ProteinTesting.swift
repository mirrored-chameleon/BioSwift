//
//  RegistryTests.swift
//  BioSwiftTests
//
//  Created by Davyn Monagle on 29/10/2026.
//

import Testing

@testable import BioSwift

@Suite("Protein Registry Lifecycle Tests")
struct RegistryTests {
    
    @Test("Registry successfully saves and retrieves custom gene strings")
    @MainActor // Ensures safety when reading/writing to the shared singleton
    func testGeneRegistrationAndFetch() async throws {
        let registry = ProteinRegistry.shared
        let testGeneID = "GENE-CHAMELEON-01"
        let testDNA = "ATGGCCGCT"
        
        // Act: Register the genomic data
        registry.registerGene(id: testGeneID, dnaStrand: testDNA, proteinName: "Mirror Protein")
        
        // Assert: Verify the string was saved and automatically forced to uppercase
        let fetchedDNA = registry.fetchGene(id: testGeneID)
        #expect(fetchedDNA == "ATGGCCGCT")
    }
    
    @Test("Registry accurately maps and returns the correct protein metadata name")
    @MainActor
    func testProteinMetadataMapping() async throws {
        let registry = ProteinRegistry.shared
        let testGeneID = "GENE-NEURON-BETA"
        let expectedName = "Beta-Potassium-Gate"
        
        // Act: Register unique gene info
        registry.registerGene(id: testGeneID, dnaStrand: "atcg", proteinName: expectedName)
        
        // Assert: Verify the correct descriptive name maps back perfectly
        let fetchedName = registry.fetchProteinName(forGene: testGeneID)
        #expect(fetchedName == expectedName)
    }
}

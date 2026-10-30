//
//  Organelle.swift
//  BioSwift
//
//  Created by Davyn Monagle on 30/10/2026.
//

import Foundation

/// A standard protocol that all cellular sub-structures must inherit from to be driven by the simulation clock.
public protocol Organelle: AnyObject {
    /// Unique identifier for each individual organelle instance.
    var id: UUID { get }
    
    /// Descriptive name for logging, debugging, or frontend UI readouts.
    var description: String { get }
    
    /// Advances the internal physiological timeline of the organelle.
    /// - Parameter timeStep: Delta time increment of the master simulation clock.
    func update(timeStep: Double)
}

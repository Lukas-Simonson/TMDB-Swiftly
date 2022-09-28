//
//  CertificationModel.swift
//  
//
//  Created by Lukas Simonson on 9/28/22.
//

import Foundation

/// A Wrapper that handles the given Certification data.
public struct TSCertifications: Codable {
    
    /// All Different Certifications Keyed by Country Code.
    public var certifications: [ String : [ Certification ] ]
    
    /// A Representation of the Certification aka Rating of the given Media.
    public struct Certification: Codable {
        
        /// The name of the certification.
        public var certification: String
        
        /// What the certification means.
        public var meaning: String
        
        /// The order of 'severity' of the certification.
        public var order: Int
    }
}

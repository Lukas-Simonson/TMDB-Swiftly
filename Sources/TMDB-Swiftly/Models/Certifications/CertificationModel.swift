//
//  CertificationModel.swift
//  
//
//  Created by Lukas Simonson on 9/28/22.
//

import Foundation

public struct TSCertifications: Codable {
    
    public var certifications: [ String : [ Certification ] ]
    
    public struct Certification: Codable {
        public var certification: String
        public var meaning: String
        public var order: Int
    }
}

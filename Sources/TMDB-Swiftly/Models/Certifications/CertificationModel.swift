//
//  CertificationModel.swift
//  
//
//  Created by Lukas Simonson on 9/28/22.
//

import Foundation

public struct TSCertifications: Codable {
    
    public var certifiactions: [ String : [ Certification ] ]
    
    public struct Certification: Codable {
        var certification: String
        var meaning: String
        var order: Int
    }
}

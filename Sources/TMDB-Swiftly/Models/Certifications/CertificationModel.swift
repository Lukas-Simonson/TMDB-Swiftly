//
//  CertificationModel.swift
//  
//
//  Created by Lukas Simonson on 9/28/22.
//

import Foundation

struct TSCertifications: Codable {
    
    var certifiactions: [ String : [ Certification ] ]
    
    struct Certification: Codable {
        var certification: String
        var meaning: String
        var order: Int
    }
}

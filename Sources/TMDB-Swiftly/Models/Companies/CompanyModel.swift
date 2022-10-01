//
//  CompanyModel.swift
//  
//
//  Created by Lukas Simonson on 9/28/22.
//

import Foundation

public struct TSCompany: Codable {
    
    public let description: String
    public let headquarters: String
    public let homepage: String
    public let id: Int
    public let logoPath: String
    public let name: String
    public let originCountry: String
    // TODO: Fix Parent Company Recursion
    //public let parentCompany: ParentCompany?
    
    enum CodingKeys: String, CodingKey {
        case description
        case headquarters
        case homepage
        case id
        case logoPath = "logo_path"
        case name
        case originCountry = "origin_company"
    }
    
    public struct AlternateName: Codable {
        public let name: String
        public let type: String
    }
        
    public struct ImageInfomation: Codable {
        public let aspectRatio: Double
        public let filePath: String
        public let fileType: String
        public let voteAverage: String
        public let voteCount: Int
        public let width: Int
        
        enum CodingKeys: String, CodingKey {
            case aspectRatio = "aspect_ratio"
            case filePath = "file_path"
            case fileType = "file_type"
            case voteAverage = "vote_average"
            case voteCount = "vote_count"
            case width
        }
    }
}

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
        public let id: String
        
        init( from dict: [ String : Any ] ) throws {
            
            guard let aspect = dict[ CodingKeys.aspectRatio.rawValue ] as? Double,
                  let path = dict[ CodingKeys.filePath.rawValue ] as? String,
                  let type = dict[ CodingKeys.fileType.rawValue ] as? String,
                  let average = dict[ CodingKeys.voteAverage.rawValue ] as? String,
                  let count = dict[ CodingKeys.voteCount.rawValue ] as? Int,
                  let width = dict[ CodingKeys.width.rawValue ] as? Int,
                  let id = dict[ CodingKeys.id.rawValue ] as? String
            else { throw TMDBSwiftly.TSError.invalidData( dict ) }
            
            self.aspectRatio = aspect
            self.filePath = path
            self.fileType = type
            self.voteAverage = average
            self.voteCount = count
            self.width = width
            self.id = id            
        }
        
        enum CodingKeys: String, CodingKey {
            case aspectRatio = "aspect_ratio"
            case filePath = "file_path"
            case fileType = "file_type"
            case voteAverage = "vote_average"
            case voteCount = "vote_count"
            case width = "width"
            case id = "id"
        }
    }
}

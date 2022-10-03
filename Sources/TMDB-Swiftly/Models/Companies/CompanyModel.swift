//
//  CompanyModel.swift
//  
//
//  Created by Lukas Simonson on 9/28/22.
//

import Foundation

/// A Struct that represents a Company on TMDB.
public struct TSCompany: Codable {
    
    /// A Description of the company.
    public let description: String
    
    /// Where the company is located.
    public let headquarters: String
    
    /// A String that represents the URL of the companies homepage.
    public let homepage: String
    
    /// An ID given to the company from TMDB.
    public let id: Int
    
    /// A path that can be used to gain access to a Logo tied to the company.
    public let logoPath: String
    
    /// The name of the company.
    public let name: String
    
    /// The country that the company originates from.
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
    
    /// A Struct that represents the Alternate names a company might have.
    public struct AlternateName: Codable {
        public let name: String
        public let type: String
        
        init( from dict: [ String : Any ] ) throws {
            guard let name = dict [ "name" ] as? String,
                  let type = dict[ "type" ] as? String
            else { throw TMDBSwiftly.TSError.invalidData( dict ) }
            
            self.name = name
            self.type = type
        }
    }
    
    /// A Struct that represents information about different images that might be used with the company.
    public struct ImageInfomation: Codable {
        
        /// The aspect ratio of the image.
        public let aspectRatio: Double
        
        /// A partial path to gain access to the image.
        public let filePath: String
        
        /// The type, .png or .svg, that the image is.
        public let fileType: String
        
        /// The average score given by all voters.
        public let voteAverage: Double
        
        /// The number of votes given to the image.
        public let voteCount: Int
        
        /// The width of the image.
        public let width: Int
        
        /// An ID given by TMDB to represent the image.
        public let id: String
        
        /// Creates a image from a given Dictionary.
        init( from dict: [ String : Any ] ) throws {
            
            guard let aspect = dict[ CodingKeys.aspectRatio.rawValue ] as? Double,
                  let path = dict[ CodingKeys.filePath.rawValue ] as? String,
                  let type = dict[ CodingKeys.fileType.rawValue ] as? String,
                  let average = dict[ CodingKeys.voteAverage.rawValue ] as? Double,
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

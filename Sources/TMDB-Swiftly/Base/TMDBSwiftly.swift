//
//  TMDBSwiftly.swift
//  
//
//  Created by Lukas Simonson on 9/27/22.
//

import Foundation

struct TMDBSwiftly {
    public static let basePath = "https://www.themoviedb.org/"
    
    enum APIVersion: CustomStringConvertible {
        case v3
        case v4
        
        var description: String {
            switch self {
                case .v3: return "3"
                case .v4: return "4"
            }
        }
    }
    
    enum QueryParameter: CustomStringConvertible {
        case apiKey
        
        var description: String {
            switch self {
                case .apiKey: return "api_key="
            }
        }
    }
    
    enum TSError: Error {
        case couldntGenerateURL( from: String )
    }
}

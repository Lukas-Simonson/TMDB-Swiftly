//
//  TMDBSwiftly.swift
//  
//
//  Created by Lukas Simonson on 9/27/22.
//

import Foundation

public struct TMDBSwiftly {
    public static let basePath = "https://api.themoviedb.org/"
    
    public enum APIVersion: CustomStringConvertible {
        case v3
        case v4
        
        public var description: String {
            switch self {
                case .v3: return "3"
                case .v4: return "4"
            }
        }
    }
    
    public enum QueryParameter: CustomStringConvertible {
        case apiKey
        
        public var description: String {
            switch self {
                case .apiKey: return "api_key="
            }
        }
    }
    
    public enum TSError: Error {
        case couldntGenerateURL( from: String )
    }
}

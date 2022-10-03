//
//  TMDBSwiftly.swift
//  
//
//  Created by Lukas Simonson on 9/27/22.
//

import Foundation

public struct TMDBSwiftly {
    
    /// Base path to the TMDB API
    public static let basePath = "https://api.themoviedb.org/"
    
    private init() {}
    
    /// The version of the API to use. V3 is the main version with the current version.
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
    
    /// Query Parameters to pass to each call of the API
    public enum QueryParameter: CustomStringConvertible {
        case apiKey( value: String )
        
        public var description: String {
            switch self {
                case .apiKey( let value ): return "api_key=\(value)"
            }
        }
        
        public enum Movie: CustomStringConvertible {
            case alternativeTitles
            case changes
            case credits
            case images
            case keywords
            case lists
            case releases
            case reviews
            case similar
            case translations
            case videos
            
            public var description: String {
                switch self {
                    case .alternativeTitles: return "alternative_titles"
                    case .changes: return "changes"
                    case .credits: return "credits"
                    case .images: return "images"
                    case .keywords: return "keywords"
                    case .lists: return "lists"
                    case .releases: return "releases"
                    case .reviews: return "reviews"
                    case .similar: return "similar"
                    case .translations: return "translations"
                    case .videos: return "videos"
                }
            }
        }
    }
        
    /// Errors thrown by TMDBSwiftly
    public enum TSError: Error {
        case couldntGenerateURL( from: String )
        case couldntConvertData
        case invalidData( Any )
    }
}

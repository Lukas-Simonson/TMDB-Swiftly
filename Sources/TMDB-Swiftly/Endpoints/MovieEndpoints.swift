//
//  MovieEndpoints.swift
//  
//
//  Created by Lukas Simonson on 10/3/22.
//

import Foundation
import HydraSwiftExtensions

extension TMDBSwiftly.Movie {
    
    // MARK: - Get Detail
    
    /// Retrieves company details information and converts it to the given `Codable` object.
    ///
    /// - Parameters:
    ///   - id: The id of the company whos information you are accessing.
    ///   - key: An API key to access TMDB.
    ///
    public static func getDetails< Movie: Codable >(
        for id: Int,
        apiKey key: String,
        appending appends: [ TMDBSwiftly.QueryParameter.Movie ] = []
    ) async throws -> Movie {
        
        let urlString = "\( TMDBSwiftly.basePath )\( TMDBSwiftly.APIVersion.v3 )/movie/\( id )?\( TMDBSwiftly.QueryParameter.apiKey( value: key ) )&\(appends.appendToResponseString())"
        guard let url = URL( string: urlString ) else {
            throw TMDBSwiftly.TSError.couldntGenerateURL( from: urlString )
        }
        
        return try await HydraHTTP.getObjectFromUrl( url )
    }
}

extension Array where Element == TMDBSwiftly.QueryParameter.Movie {
    func appendToResponseString() -> String {
        
        var baseString = "append_to_response="
        
        for item in self {
            baseString.append("\(item),")
        }
        
        return baseString
    }
}

//
//extension TMDBSwiftly.QueryParameter.Movie {
//
//    static func appendToResponseString() -> String {
//
//    }
//
//}

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
    
    /// Retrieves movie details information and converts it to a TSMovie object.
    ///
    /// - Parameters:
    ///   - id: The id of the company whos information you are accessing.
    ///   - key: An API key to access TMDB.
    ///   - appending: A list of Movie Query Parameters to append to the query.
    ///
    public static func getDetailsTS(
        for id: Int,
        apiKey key: String,
        appending appends: [ TMDBSwiftly.QueryParameter.Movie ] = []
    ) async throws -> TSMovie {
        return try await getDetails(for: id, apiKey: key, appending: appends)
    }
    
    /// Retrieves movie details information and converts it to the given `Codable` object.
    ///
    /// - Parameters:
    ///   - id: The id of the company whos information you are accessing.
    ///   - key: An API key to access TMDB.
    ///   - appending: A list of Movie Query Parameters to append to the query.
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
        
        return try await HydraHTTP.getObjectFromURL( url )
    }
    
    public static func getCertification(
        for id: Int,
        apiKey key: String,
        country: TMDBSwiftly.TSRegion
    ) async throws -> String {
        
        let urlString = "\(TMDBSwiftly.basePath)\(TMDBSwiftly.APIVersion.v3)/movie/\(id)?\(TMDBSwiftly.QueryParameter.apiKey(value: key))"
        guard let url = URL(string: urlString)
        else { throw TMDBSwiftly.TSError.couldntGenerateURL(from: urlString) }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        if let json = try JSONSerialization.jsonObject(with: data) as? [String : Any],
           let releaseDates = json["results"] as? [[String : Any]],
           let releaseDate = releaseDates.first(where: { $0["iso_3166_1"] as? String == country.description }),
           let result = releaseDate["release_dates"] as? [[String : Any]],
           let cert = result.first?["certification"] as? String {
            return cert
        }
        
        throw TMDBSwiftly.TSError.noCertFound
    }
    
    // MARK: - Now Playing
    
    public static func nowPlayingTS(
        apiKey key: String,
        page: Int = 1,
        language: TMDBSwiftly.TSLanguage = .USEnglish,
        region: TMDBSwiftly.TSRegion = .unitedStatesOfAmerica
    ) async throws -> TSMovieResults {
        return try await nowPlaying(apiKey: key, page: page, language: language, region: region)
    }
    
    public static func nowPlaying< Results: Codable >(
        apiKey key: String,
        page: Int = 1,
        language: TMDBSwiftly.TSLanguage = .USEnglish,
        region: TMDBSwiftly.TSRegion = .unitedStatesOfAmerica
    ) async throws -> Results {
        
        let urlString = "\( TMDBSwiftly.basePath )\( TMDBSwiftly.APIVersion.v3 )/movie/now_playing?\( TMDBSwiftly.QueryParameter.apiKey( value: key ) )"
        guard let url = URL( string: urlString ) else {
            throw TMDBSwiftly.TSError.couldntGenerateURL(from: urlString)
        }
        
        //return try await HydraHTTP.getObjectFromURL( url )
        return try await HydraHTTP.getObjectFromURL( url )
    }
}

extension Array where Element == TMDBSwiftly.QueryParameter.Movie {
    func appendToResponseString() -> String {
        self.reduce("", { $0 + "\($1), " })
    }
}

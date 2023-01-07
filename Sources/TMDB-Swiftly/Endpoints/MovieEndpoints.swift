//
//  MovieEndpoints.swift
//  
//
//  Created by Lukas Simonson on 10/3/22.
//

import Foundation
import HydraSwiftExtensions

// MARK: Get Details
extension TMDBSwiftly.Movie {
    
    /// Retrieves movie details information and converts it to a TSMovie object.
    ///
    /// - Parameters:
    ///   - id: The id of the movie whos information you are accessing.
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
    ///   - id: The id of the movie whos information you are accessing.
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
    
    /// Gets the latest Certification for the given Movie in the given Countries.
    ///
    /// - Parameters:
    ///   - id: The id of the movie whos information you are accessing.
    ///   - key: An API key to access TMDB.
    ///   - countries: The countries whos Certification you are attempting to retrieve.
    ///
    public static func getCertifications(
        for id: Int,
        apiKey key: String,
        in countries: [TMDBSwiftly.TSRegion]
    ) async throws -> [TMDBSwiftly.TSRegion : String] {
        
        let urlString = "\(TMDBSwiftly.basePath)\(TMDBSwiftly.APIVersion.v3)/movie/\(id)/release_dates?\(TMDBSwiftly.QueryParameter.apiKey(value: key))"
        
        guard let url = URL(string: urlString),
              countries.count > 0
        else { throw TMDBSwiftly.TSError.couldntGenerateURL(from: urlString) }
        
        var neededCountries = countries
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        guard let json = try JSONSerialization.jsonObject(with: data) as? [String : Any],
              let releaseDates = json["results"] as? [[String : Any]]
        else { throw TMDBSwiftly.TSError.couldntConvertData }
        
        var results = [TMDBSwiftly.TSRegion : String]()
        
        for date in releaseDates {
            if let countryCodeString = date["iso_3166_1"] as? String,
               let country = neededCountries.first(where: { $0.description == countryCodeString }),
               let result = date["release_dates"] as? [[String : Any]],
               let cert = result.first?["certification"] as? String {
                results[country] = cert
                neededCountries.removeMatching(country)
                if neededCountries.isEmpty { return results }
            }
        }
        
        if !results.isEmpty {
            return results
        }
        
        throw TMDBSwiftly.TSError.noCertFound
    }
    
    /// Gets the latest Certification for the given Movie in the given Country.
    ///
    /// - Parameters:
    ///   - id: The id of the movie whos information you are accessing.
    ///   - key: An API key to access TMDB.
    ///   - country: The country whos Certification you are attempting to retrieve.
    ///
    public static func getCertification(
        for id: Int,
        apiKey key: String,
        in country: TMDBSwiftly.TSRegion
    ) async throws -> String {
        
        let urlString = "\(TMDBSwiftly.basePath)\(TMDBSwiftly.APIVersion.v3)/movie/\(id)/release_dates?\(TMDBSwiftly.QueryParameter.apiKey(value: key))"
        
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
}

// MARK: Get Now Playing
extension TMDBSwiftly.Movie {
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

// MARK: Search Movies
extension TMDBSwiftly.Movie {
    
    public static func searchTS(
        for search: String,
        apiKey key: String,
        page: Int = 1,
        language: TMDBSwiftly.TSLanguage = .USEnglish,
        region: TMDBSwiftly.TSRegion = .unitedStatesOfAmerica
    ) async throws -> TSMovieResults {
        try await Self.search(for: search, apiKey: key, page: page, language: language, region: region)
    }
    
    public static func search<Results: Codable>(
        for search: String,
        apiKey key: String,
        page: Int = 1,
        language: TMDBSwiftly.TSLanguage = .USEnglish,
        region: TMDBSwiftly.TSRegion = .unitedStatesOfAmerica
    ) async throws -> Results {
        
        let urlString = "\(TMDBSwiftly.basePath)\(TMDBSwiftly.APIVersion.v3)/search/movie?\(TMDBSwiftly.QueryParameter.apiKey(value: key))&query=\(search)"
        guard let url = URL(string: urlString)
        else { throw TMDBSwiftly.TSError.couldntGenerateURL(from: urlString) }
        
        return try await HydraHTTP.getObjectFromURL(url)
    }
    
}

extension Array where Element == TMDBSwiftly.QueryParameter.Movie {
    func appendToResponseString() -> String {
        self.reduce("", { $0 + "\($1), " })
    }
}

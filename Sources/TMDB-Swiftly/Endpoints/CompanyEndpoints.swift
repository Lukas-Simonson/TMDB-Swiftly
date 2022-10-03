//
//  CompanyEndpoints.swift
//  
//
//  Created by Lukas Simonson on 9/28/22.
//

import Foundation
import HydraSwiftExtensions

extension TMDBSwiftly.Company {
    
    // MARK: - Details
    
    /// Retrieves company details information and converts it to a TSCompany object.
    ///
    /// - Parameters:
    ///   - id: The id of the company whos information you are accessing.
    ///   - key: An API key to access TMDB.
    ///
    public static func getDetailsTS( for id: Int, apiKey key: String ) async throws -> TSCompany {
        return try await getDetails( for: id, apiKey: key )
    }
    
    /// Retrieves company details information and converts it to the given `Codable` object.
    ///
    /// - Parameters:
    ///   - id: The id of the company whos information you are accessing.
    ///   - key: An API key to access TMDB.
    ///
    public static func getDetails< Company: Codable >( for id: Int, apiKey key: String ) async throws -> Company {
        
        let urlString = "\( TMDBSwiftly.basePath )\( TMDBSwiftly.APIVersion.v3 )/company/\( id )?\( TMDBSwiftly.QueryParameter.apiKey( value: key ) )"
        guard let url = URL( string: urlString ) else {
            throw TMDBSwiftly.TSError.couldntGenerateURL( from: urlString )
        }
        
        return try await HydraHTTP.getObjectFromUrl( url )
    }
    
    // MARK: - Alternate Names
    
    /// Retrieves a companies alternate names and converts them into an Array of TSCompany.AlternateName objects.
    ///
    /// - Parameters:
    ///   - id: The id of the company whos information you are accessing.
    ///   - key: An API key to access TMDB.
    ///
    public static func getAlternateNamesTS( for id: Int, apiKey key: String ) async throws -> [TSCompany.AlternateName] {
        
        let urlString = "\( TMDBSwiftly.basePath )\( TMDBSwiftly.APIVersion.v3 )/company/\( id )/alternative_names?\( TMDBSwiftly.QueryParameter.apiKey( value: key ) )"
        guard let url = URL(string: urlString) else { throw TMDBSwiftly.TSError.couldntGenerateURL(from: urlString) }
        
        let ( data, _ ) = try await URLSession.shared.data( from: url )
        
        let json = try JSONSerialization.jsonObject( with: data )

        if let details = json as? [ String : Any ],
           let results = details[ "results" ] as? [[ String : Any ]] {
            return results.compactMap { jsonDict in
                try? TSCompany.AlternateName( from: jsonDict )
            }
        }
        
        throw TMDBSwiftly.TSError.couldntConvertData
    }
    
    /// Retrieves a companies alternate names and converts them into the given `Codable` object.
    ///
    /// - Parameters:
    ///   - id: The id of the company whos information you are accessing.
    ///   - key: An API key to access TMDB.
    ///
    public static func getAlternateNames< AlternativeNames: Codable >( for id: Int, apiKey key: String ) async throws -> AlternativeNames {
        
        let urlString = "\( TMDBSwiftly.basePath )\( TMDBSwiftly.APIVersion.v3 )/company/\( id )/alternative_names?\( TMDBSwiftly.QueryParameter.apiKey( value: key ) )"
        guard let url = URL( string: urlString ) else {
            throw TMDBSwiftly.TSError.couldntGenerateURL( from: urlString )
        }
        
        return try await HydraHTTP.getObjectFromUrl( url )
    }
    
    // MARK: - Images
    
    /// Retrieves a companies images information and converts it into an array of TSCompany.ImageInformation objects.
    ///
    /// - Parameters:
    ///   - id: The id of the company whos information you are accessing.
    ///   - key: An API key to access TMDB.
    ///
    public static func getImagesDataTS( for id: Int, apiKey key: String ) async throws -> [ TSCompany.ImageInfomation ] {
        
        let urlString = "\( TMDBSwiftly.basePath )\( TMDBSwiftly.APIVersion.v3 )/company/\( id )/images?\( TMDBSwiftly.QueryParameter.apiKey( value: key ) )"
        guard let url = URL( string: urlString ) else {
            throw TMDBSwiftly.TSError.couldntGenerateURL( from: urlString )
        }
        
        let ( data, _ ) = try await URLSession.shared.data( from: url )
                
        let json = try JSONSerialization.jsonObject( with: data )

        if let details = json as? [ String : Any ],
           let logos = details[ "logos" ] as? [[ String : Any ]] {
            return logos.compactMap { jsonDict in
                try? TSCompany.ImageInfomation( from: jsonDict )
            }
        }
        
        throw TMDBSwiftly.TSError.couldntConvertData
    }
    
    /// Retrieves a companies images information and converts it into the given `Codable` object.
    ///
    /// - Parameters:
    ///   - id: The id of the company whos information you are accessing.
    ///   - key: An API key to access TMDB.
    ///
    public static func getImagesData< ImageDataArray: Codable >( for id: Int, apiKey key: String ) async throws -> ImageDataArray {
        
        let urlString = "\( TMDBSwiftly.basePath )\( TMDBSwiftly.APIVersion.v3 )/company/\( id )/images?\( TMDBSwiftly.QueryParameter.apiKey( value: key ) )"
        guard let url = URL( string: urlString ) else {
            throw TMDBSwiftly.TSError.couldntGenerateURL( from: urlString )
        }
        
        return try await HydraHTTP.getObjectFromUrl( url )
    }
}

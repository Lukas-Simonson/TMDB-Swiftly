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
    public static func getDetailsTS( for id: Int, apiKey key: String ) async throws -> TSCompany {
        return try await getDetails(for: id, apiKey: key)
    }
    
    public static func getDetails< Company: Codable >( for id: Int, apiKey key: String ) async throws -> Company {
        
        let urlString = "\( TMDBSwiftly.basePath )\( TMDBSwiftly.APIVersion.v3 )/company/\(id)?\( TMDBSwiftly.QueryParameter.apiKey(value: key) )"
        guard let url = URL(string: urlString) else {
            throw TMDBSwiftly.TSError.couldntGenerateURL(from: urlString)
        }
        
        return try await HydraHTTP.getObjectFromUrl(url)
    }
    
    // MARK: - Alternate Names
    public static func getAlternateNamesTS( for id: Int, apiKey key: String ) async throws -> TSCompany.AlternateName {
        return try await getAlternateNames(for: id, apiKey: key)
    }
    
    public static func getAlternateNames< Company: Codable >( for id: Int, apiKey key: String ) async throws -> Company {
        
        let urlString = "\( TMDBSwiftly.basePath )\( TMDBSwiftly.APIVersion.v3 )/company/\(id)/alternative_names?\( TMDBSwiftly.QueryParameter.apiKey(value: key) )"
        guard let url = URL(string: urlString) else {
            throw TMDBSwiftly.TSError.couldntGenerateURL(from: urlString)
        }
        
        return try await HydraHTTP.getObjectFromUrl(url)
    }
    
    // MARK: - Images
    
}

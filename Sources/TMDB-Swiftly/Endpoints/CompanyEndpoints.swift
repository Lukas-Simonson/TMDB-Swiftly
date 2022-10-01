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
    public static func getImagesDataTS( for id: Int, apiKey key: String ) async throws -> [ TSCompany.ImageInfomation ] {
        
        let urlString = "\( TMDBSwiftly.basePath )\( TMDBSwiftly.APIVersion.v3 )/company/\(id)/images?\( TMDBSwiftly.QueryParameter.apiKey(value: key) )"
        guard let url = URL(string: urlString) else {
            throw TMDBSwiftly.TSError.couldntGenerateURL(from: urlString)
        }
        
        let ( data, _ ) = try await URLSession.shared.data(from: url)
                
        let json = try JSONSerialization.jsonObject(with: data)
        if let details = json as? [ String : Any ] {
            if let images = details[ "logos" ] as? [ TSCompany.ImageInfomation ] {
                return images
            }
        }
        throw TMDBSwiftly.TSError.couldntConvertData
    }
    
    public static func getImagesData< ImageData: Codable >( for id: Int, apiKey key: String ) async throws -> ImageData {
        
        let urlString = "\( TMDBSwiftly.basePath )\( TMDBSwiftly.APIVersion.v3 )/company/\(id)/images?\( TMDBSwiftly.QueryParameter.apiKey(value: key) )"
        guard let url = URL(string: urlString) else {
            throw TMDBSwiftly.TSError.couldntGenerateURL(from: urlString)
        }
        
        return try await HydraHTTP.getObjectFromUrl(url)
    }
}

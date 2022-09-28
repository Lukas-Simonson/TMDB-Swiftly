//
//  Certification.swift
//  
//
//  Created by Lukas Simonson on 9/28/22.
//

import Foundation
import HydraSwiftExtensions

extension TMDBSwiftly.Certification {
    
    // MARK: Movie Certifications
    public static func getMovieTSCertifications( key: String ) async throws -> TSCertifications {
        return try await getMovieCertifications(key: key)
    }
    
    public static func getMovieCertifications< Cert: Codable >( key: String ) async throws -> Cert {
        let urlString = "\(TMDBSwiftly.basePath)\(TMDBSwiftly.APIVersion.v3)/certification/movie/list?\(TMDBSwiftly.QueryParameter.apiKey)\(key)"
        
        guard let url = URL(string: urlString) else {
            throw TMDBSwiftly.TSError.couldntGenerateURL(from: urlString )
        }
        
        return try await HydraHTTP.getObjectFromUrl(url)
    }
    
    // MARK: TV Certifications
    public static func getTVTSCertifications( key: String ) async throws -> TSCertifications {
        return try await getTVCertifications(key: key)
    }
    
    public static func getTVCertifications< Cert: Codable >( key: String ) async throws -> Cert {
        let urlString = "\(TMDBSwiftly.basePath)\(TMDBSwiftly.APIVersion.v3)/certification/tv/list?\(TMDBSwiftly.QueryParameter.apiKey)\(key)"
        
        guard let url = URL(string: urlString) else {
            throw TMDBSwiftly.TSError.couldntGenerateURL(from: urlString )
        }
        
        return try await HydraHTTP.getObjectFromUrl(url)
    }
}

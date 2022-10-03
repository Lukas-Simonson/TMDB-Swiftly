//
//  Certification.swift
//  
//
//  Created by Lukas Simonson on 9/28/22.
//

import Foundation
import HydraSwiftExtensions

extension TMDBSwiftly.Certification {
    
    // MARK: - Movie Certifications
    
    /// Retrieves Movie Certification data and converts it to a TSCertification object.
    ///
    /// - Parameters:
    ///   - key: An API key to access TMDB.
    ///
    public static func getMovieCertificationsTS( key: String ) async throws -> TSCertifications {
        return try await getMovieCertifications(key: key)
    }
    
    /// Retrieves Movie Certification data and converts it to the given `Codable` object.
    ///
    /// - Parameters:
    ///   - key: An API key to access TMDB.
    ///
    public static func getMovieCertifications< Cert: Codable >( key: String ) async throws -> Cert {
        
        let urlString = "\(TMDBSwiftly.basePath)\(TMDBSwiftly.APIVersion.v3)/certification/movie/list?\(TMDBSwiftly.QueryParameter.apiKey(value: key))"
        guard let url = URL(string: urlString) else {
            throw TMDBSwiftly.TSError.couldntGenerateURL(from: urlString )
        }
        
        return try await HydraHTTP.getObjectFromUrl(url)
    }
    
    // MARK: - TV Certifications
    
    /// Retrieves TV Certification data and converts it to a TSCertification object.
    ///
    /// - Parameters:
    ///   - key: An API key to access TMDB.
    ///
    public static func getTVCertificationsTS( key: String ) async throws -> TSCertifications {
        return try await getTVCertifications(key: key)
    }
    
    /// Retrieves TV Certification data and converts it to the given `Codable` object.
    ///
    /// - Parameters:
    ///   - key: An API key to access TMDB.
    ///
    public static func getTVCertifications< Cert: Codable >( key: String ) async throws -> Cert {
        
        let urlString = "\(TMDBSwiftly.basePath)\(TMDBSwiftly.APIVersion.v3)/certification/tv/list?\(TMDBSwiftly.QueryParameter.apiKey(value: key))"
        guard let url = URL(string: urlString) else {
            throw TMDBSwiftly.TSError.couldntGenerateURL(from: urlString )
        }
        
        return try await HydraHTTP.getObjectFromUrl(url)
    }
}

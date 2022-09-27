//
//  TMDBSwiftly.swift
//  
//
//  Created by Lukas Simonson on 9/27/22.
//

import Foundation

struct TMDBSwiftly {
    private static let basePath = "https://www.themoviedb.org/"
    
    enum APIVersion: CustomStringConvertible {
        case v3
        case v4
        
        var description: String {
            switch self {
                case .v3: return "3"
                case .v4: return "4"
            }
        }
    }
}

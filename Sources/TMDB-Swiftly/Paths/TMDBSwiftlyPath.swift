//
//  TMDBSwiftlyPath.swift
//  
//
//  Created by Lukas Simonson on 9/27/22.
//

import Foundation

protocol TMDBSwiftlyPath {  }

extension TMDBSwiftly {
    
    enum Path: CustomStringConvertible {
        case company
        case configuration
        case credits
        case discover
        case find
        case genre
        case guestSession
        case keyword
        case list
        case movie
        case network
        case trending
        case person
        case review
        case search
        case watchProviders
        
        var description: String {
            return ""
        }
    }
}

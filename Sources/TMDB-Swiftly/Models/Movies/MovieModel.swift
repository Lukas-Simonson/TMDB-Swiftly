//
//  MovieModel.swift
//  
//
//  Created by Lukas Simonson on 10/3/22.
//

import Foundation

struct TSMovie: Codable {
    
    var adult: Bool
    var backdropPath: String?
    //var belongsToCollection
    var budget: Int
    var genres: [ Genre ]
    var homepage: String?
    var id: Int
    var imdbID: String?
    var originalLanguage: String
    var originalTitle: String
    var overview: String?
    var popularity: Double
    var posterPath: String?
    var productionCompanies: [ TSCompany ]
    
    struct Genre: Codable {
        let id: Int
        let name: String
    }
}

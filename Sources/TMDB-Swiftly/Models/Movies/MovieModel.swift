//
//  MovieModel.swift
//  
//
//  Created by Lukas Simonson on 10/3/22.
//

import Foundation

struct TSMovie: Codable {
    
    let adult: Bool?
    let backdropPath: String?
    let belongsToCollection: [ MovieCollection ]?
    let budget: Int?
    let genres: [ Genre ]?
    let homepage: String?
    let id: Int?
    let imdbID: String?
    let originalLanguage: String?
    let originalTitle: String?
    let overview: String?
    let popularity: Double?
    let posterPath: String?
    let productionCompanies: [ TSCompany ]?
    let productionCountries: [ ProductionCountry ]?
    let releaseDate: String?
    let revenue: Int?
    let runtime: Int?
    let spokenLanguages: [ SpokenLanguage ]?
    let status: String?
    let tagline: String?
    let title: String?
    let video: Bool?
    let voteAverage: Double?
    let voteCount: Double?
    
    struct MovieCollection: Codable {
        let id: Int?
        let name: String?
        let posterPath: String?
        let backdropPath: String?
    }
    
    struct SpokenLanguage: Codable {
        let countryCode: String
        let englishName: String
        let name: String
    }
    
    struct ProductionCountry: Codable {
        let countryCode: String
        let name: String
    }
    
    struct Genre: Codable {
        let id: Int
        let name: String
    }
}

/*
 {
   "status": "Released",
   "tagline": "The greatest fairy tale never told.",
   "title": "Shrek",
   "video": false,
   "vote_average": 7.702,
   "vote_count": 14328
 }
 */

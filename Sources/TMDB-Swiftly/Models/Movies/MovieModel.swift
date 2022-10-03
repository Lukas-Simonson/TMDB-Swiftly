//
//  MovieModel.swift
//  
//
//  Created by Lukas Simonson on 10/3/22.
//

import Foundation

public struct TSMovie: Codable {
    
    let adult: Bool?
    let backdropPath: String?
    let belongsToCollection: MovieCollection?
    let budget: Int?
    let genres: [ Genre ]?
    let homepage: String?
    let id: Int
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
    
    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case belongsToCollection = "belongs_to_collection"
        case budget
        case genres
        case homepage
        case id
        case imdbID = "imdb_id"
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview
        case popularity
        case posterPath = "poster_path"
        case productionCompanies = "production_companies"
        case productionCountries = "production_countries"
        case releaseDate = "release_date"
        case revenue
        case runtime
        case spokenLanguages = "spoken_languages"
        case status
        case tagline
        case title
        case video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
    
    struct MovieCollection: Codable {
        let id: Int?
        let name: String?
        let posterPath: String?
        let backdropPath: String?
        
        enum CodingKeys: String, CodingKey {
            case id
            case name
            case posterPath = "poster_path"
            case backdropPath = "backdrop_path"
        }
    }
    
    struct SpokenLanguage: Codable {
        let countryCode: String
        let englishName: String
        let name: String
        
        enum CodingKeys: String, CodingKey {
            case countryCode = "iso_639_1"
            case englishName = "english_name"
            case name
        }
    }
    
    struct ProductionCountry: Codable {
        let countryCode: String
        let name: String
        
        enum CodingKeys: String, CodingKey {
            case countryCode = "iso_3166_1"
            case name
        }
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

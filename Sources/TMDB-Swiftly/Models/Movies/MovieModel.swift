//
//  MovieModel.swift
//  
//
//  Created by Lukas Simonson on 10/3/22.
//

import Foundation

public struct TSMovie: Codable {
    
    public let adult: Bool?
    public let backdropPath: String?
    public let belongsToCollection: MovieCollection?
    public let budget: Int?
    public let genres: [ Genre ]?
    public let homepage: String?
    public let id: Int
    public let imdbID: String?
    public let originalLanguage: String?
    public let originalTitle: String?
    public let overview: String?
    public let popularity: Double?
    public let posterPath: String?
    public let productionCompanies: [ TSCompany ]?
    public let productionCountries: [ ProductionCountry ]?
    public let releaseDate: String?
    public let revenue: Int?
    public let runtime: Int?
    public let spokenLanguages: [ SpokenLanguage ]?
    public let status: String?
    public let tagline: String?
    public let title: String?
    public let video: Bool?
    public let voteAverage: Double?
    public let voteCount: Double?
    
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
    
    public struct MovieCollection: Codable {
        public let id: Int?
        public let name: String?
        public let posterPath: String?
        public let backdropPath: String?
        
        enum CodingKeys: String, CodingKey {
            case id
            case name
            case posterPath = "poster_path"
            case backdropPath = "backdrop_path"
        }
    }
    
    public struct SpokenLanguage: Codable {
        public let countryCode: String
        public let englishName: String
        public let name: String
        
        enum CodingKeys: String, CodingKey {
            case countryCode = "iso_639_1"
            case englishName = "english_name"
            case name
        }
    }
    
    public struct ProductionCountry: Codable {
        public let countryCode: String
        public let name: String

        enum CodingKeys: String, CodingKey {
            case countryCode = "iso_3166_1"
            case name
        }
    }
    
    public struct Genre: Codable {
        public let id: Int
        public let name: String
    }
    
    public struct TSMovieResults: Codable {
        public let page: Int?
        public let results: [ TSMovie ]?
        public let dates: Dates?
        public let totalPages: Int?
        public let totalResults: Int?
        
        enum CodingKeys: String, CodingKey {
            case page
            case results
            case dates
            case totalPages = "total_pages"
            case totalResults = "total_results"
        }
        
        public struct Dates: Codable {
            let minimum: String?
            let maximum: String?
        }
    }
}

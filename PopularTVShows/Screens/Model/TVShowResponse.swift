//
//  TVShowResponse.swift
//  PopularTVShows
//
//  Created by Syed Raza on 7/22/23.
//

import Foundation
struct TVShowResponse: Decodable {
    
    let results: [shows]
}
struct shows: Identifiable,Decodable {
    
    var id = UUID()
    let originalName: String
    let originalLanguage: String
    let popularity: Double
    let posterPath: String
    let voteAverage: Double
    let voteCount: Int
    enum CodingKeys: String, CodingKey {
            case originalName = "original_name"
            case originalLanguage = "original_language"
            case popularity
            case posterPath = "poster_path"
            case voteAverage = "vote_average"
            case voteCount = "vote_count"
        }
       
 }
    

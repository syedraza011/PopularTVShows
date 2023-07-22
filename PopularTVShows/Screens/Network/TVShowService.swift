//
//  TVShowService.swift
//  PopularTVShows
//
//  Created by renupunjabi on 7/22/23.
//

import Foundation
enum APIError: Error {
    case invalidUrl
    case invalidResponse
    case decodingError
}
class TVShowService {
    
    let urlString = "https://api.themoviedb.org/3/tv/popular?api_key=4f34c339d8bdc6ab7df92feee933b3d2&language=en-US&page=1"
    
    // replace the path of the image in below
    let posterImage = "https://image.tmdb.org/t/p/w500/voaKRrYExZNkf1E4FZExU7fTd8w.jpg"
    
    func fetchTVShows () async throws -> [TVShowResponse] {
        guard let url = URL( string: urlString) else {
            throw APIError.invalidUrl
        }
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let resp = response as? HTTPURLResponse, resp.statusCode == 200 else {
            throw APIError.invalidResponse
        }
        do {
            return try JSONDecoder().decode([TVShowResponse].self, from: data)
        } catch {
            throw APIError.decodingError
        }
    }
}

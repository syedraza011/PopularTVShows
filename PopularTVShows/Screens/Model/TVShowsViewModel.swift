//
//  TVShowViewModel.swift
//  PopularTVShows
//
//  Created by Syed Raza on 7/22/23.
//

import Foundation

@MainActor class TVShowsViewModel: ObservableObject {

    @Published var tvshows = [TVShowResponse]() // Update the array type here
    @Published var state: AsyncState = .initial

    let service = TVShowService()

    func getTVShows() {
        state = .loading
        Task {
            do {
                let response = try await service.fetchTVShows()
                
                    self.tvshows = response
                    self.state = .loaded
                
            } 
        }
    }
}


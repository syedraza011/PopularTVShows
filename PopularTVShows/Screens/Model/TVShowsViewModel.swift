//
//  TVShowViewModel.swift
//  PopularTVShows
//
//  Created by Syed Raza on 7/22/23.
//


import Foundation
class TVShowsViewModel: ObservableObject {

    @Published var tvshows = [TVShowResponse]()
    @Published var state: AsyncState = .initial

    let service = TVShowService()

    func getTVShows () {
        state = .loading
        Task {
            do {
                let response = try await service.fetchTVShows()
                DispatchQueue.main.async {
                    self.tvshows = response
                    self.sate = .loaded
                }
            }catch{
                DispatchQueue.main.async {
                    self.state = .error(error)
                }
            }
        }

    }
}

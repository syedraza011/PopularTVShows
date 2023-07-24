//
//  ContentView.swift
//  PopularTVShows
//
//  Created by Syed Raza on 7/22/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = TVShowsViewModel()
    
    var body: some View {
        NavigationView(){
            VStack{
              ForEach (viewModel.tvshows){ show in
                  Text(show.results.description)
                }
            }
            
        }
            .onAppear(){
                viewModel.getTVShows()
        }.navigationTitle("Best TV Shows")
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


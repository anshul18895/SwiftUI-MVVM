//
//  ContentView.swift
//  SwiftUI-MVVM
//
//  Created by Anshul on 16/01/20.
//  Copyright © 2020 Anshul Shah. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var movies: [Movie] //= [Movie(),Movie()]
    var body: some View {
        NavigationView{
            List(movies) { movie in
                MovieListView(movie: movie)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(movies: [])
    }
}

//
//  MovieListView.swift
//  SwiftUI-MVVM
//
//  Created by Anshul on 16/01/20.
//  Copyright © 2020 Anshul Shah. All rights reserved.
//

import SwiftUI
import Combine

struct MovieListView: View {
    @State var movies: [Movie] //= [Movie(),Movie()]
    var body: some View {
        NavigationView{
            VStack {
                if 0==0{
                    List(movies) { movie in
                        MovieListCell(movie: movie)
                    }
                }
            }.padding(.leading, -20)
            .padding(.trailing, -20)
        .navigationBarTitle("Hello")
        }
    }
}
//
//class MovieListViewModal: ObservableObject{
//    
//    private var cancellable: [AnyCancellable] = []
//    private var movieListPipeLine: AnyPublisher<MovieResponse,APIError>?
//
//    @Published var movies: [Movie]
//        
//    init(){
//            
//    }
//    
//    func setupInput(){
//        
//    }
//    
//}

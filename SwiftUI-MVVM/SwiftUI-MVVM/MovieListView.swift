//
//  MovieListView.swift
//  SwiftUI-MVVM
//
//  Created by Anshul on 16/01/20.
//  Copyright © 2020 Anshul Shah. All rights reserved.
//

import SwiftUI

class Movie: Identifiable{
    var name: String?
    var releaseDate: String?
    var description: String?
    var imageName: String?
    
    init() {
        self.name = "Joker"
        self.releaseDate = "2019-10-04"
        self.description = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book."
        self.imageName = "image"
    }
}



struct MovieListView: View {
    @State var movie: Movie!
    var body: some View {
       ZStack{
            HStack.init(alignment: .top, spacing: 0) {
                Image(movie.imageName ?? "")
                    .resizable().frame(width: 150, height: 225)
                    .scaledToFill()
                    .padding(5)
                    .cornerRadius(25)
                VStack.init(alignment: .leading, spacing: 5) {
                    HStack{
                        Text(movie.name ?? "").bold()
                        Spacer()
                    }
                    Text(movie.releaseDate ?? "")
                    Text(movie.description ?? "")
                }.padding(5)
            }.padding([.leading, .trailing], 0)
        }.background(Color.red).padding(15).cornerRadius(25)
    }
}


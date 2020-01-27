//
//  MovieListCell.swift
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
        self.description = "Lorem Ipsum is simply dummy text of the printing and typesetting industry."
        self.imageName = "image"
    }
}



struct MovieListCell: View {
    @State var movie: Movie!
    var body: some View {
       ZStack{
            HStack.init(alignment: .top, spacing: 0) {
                Image(movie.imageName ?? "")
                    .resizable().frame(width: 150, height: 225)
                    .scaledToFill()
                    .padding(5)
                    .cornerRadius(25)
                    .clipShape(Circle())
                VStack.init(alignment: .leading, spacing: 5) {
                    HStack{
                        Text(movie.name ?? "").bold()
                        Spacer()
                    }
                    Text(movie.releaseDate ?? "")
                    Text(movie.description ?? "")
                }.padding(5)
            }.padding([.leading, .trailing], 0)
        }.background(Color.red).cornerRadius(5)
    }
}


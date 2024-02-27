//
//  SeriesRowView.swift
//  KC-Marvel-SuperPowers
//
//  Created by Daniel Cazorro Frías on 27/2/24.
//

import SwiftUI

struct SeriesRowView: View {
    
    var serie: Series
    
    var body: some View {
        ZStack {
            AsyncImage(url: URL(string: "\(serie.thumbnail.path)/landscape_small.\(serie.thumbnail.thumbnailExtension)")) {image in
                image
                    .resizable()
                    .cornerRadius(10)
                    .aspectRatio(contentMode: .fit)
                    .opacity(1)
            } placeholder: {
                Image(systemName: "photo")
                    .resizable()
                    .cornerRadius(10)
                    .aspectRatio(contentMode: .fit)
                    .opacity(1)
            }
            .id(1)
            .ignoresSafeArea()
            
            //TITULO
            VStack {
                Spacer()
                ZStack {
                    Image(decorative: "")
                        .resizable()
                        .background(.black)
                        .frame(height: 50)
                        .opacity(0.7)
                        .cornerRadius(10)
                        .id(2)
                    
                    Text("\(serie.title)")
                        .padding(.bottom, 10)
                        .font(.caption)
                        .foregroundColor(.white)
                        .aspectRatio(contentMode: .fit)
                        .bold()
                        .id(3)
                }
            }
            .padding(.bottom, 10)
        }
    }
}

#Preview {
    SeriesRowView(serie: Series(id: 1, title: "Daniel", description: "º", resourceURI: "", startYear: 5, endYear: 10, rating: "", modified: "", thumbnail: Thumbnail(path: "", thumbnailExtension: .jpg)))
}

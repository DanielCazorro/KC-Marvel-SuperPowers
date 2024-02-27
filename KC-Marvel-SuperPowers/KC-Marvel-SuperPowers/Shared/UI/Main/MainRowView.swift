//
//  MainRowView.swift
//  KC-Marvel-SuperPowers
//
//  Created by Daniel Cazorro Frías on 17/11/23.
//

import SwiftUI

struct MainRowView: View {
    var character: Character
    
    var body: some View {
        
        ZStack {
            
            AsyncImage(url: URL(string: "\(character.thumbnail.path).\(character.thumbnail.thumbnailExtension)")) { photo in
                photo
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(20)
                    .opacity(0.8)
                
            } placeholder: {
                ProgressView()
            }
            
            VStack(alignment: .leading) {
                // NAme
                HStack{
                    Text(character.name)
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding([.top, .leading], 20)
                    Spacer()
                }
                Spacer()
                
            }
        }
    }
}


let character1 = Character(id: 2, title: "Yes", name: "Iron Man", description: "Geius, billionaire, playboy, philanthropist.", thumbnail: Thumbnail(path: "https://i.blogs.es/0f256b/iron-man/450_1000", thumbnailExtension: .jpg), resourceURI: "https://www.example.com/character/2", modified: "2023-11-17T12:00:00Z")

#Preview {
    MainRowView(character: character1)
}


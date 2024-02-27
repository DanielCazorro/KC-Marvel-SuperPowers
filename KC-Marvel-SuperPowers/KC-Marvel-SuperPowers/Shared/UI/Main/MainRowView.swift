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
            // Fondo de la imagen del personaje
            AsyncImage(url: URL(string: "\(character.thumbnail.path).\(character.thumbnail.thumbnailExtension)")) { photo in
                photo
                    .resizable()
                    .cornerRadius(8)
                    .clipped()
                    .frame(height: 200)
                    .aspectRatio(contentMode: .fit)

            } placeholder: {
                ProgressView()
            }
            // Contenido superpuesto en la imagen del personaje
            VStack(alignment: .leading) {
                HStack{
                    // Nombre del personaje
                    Text(character.name)
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.horizontal, 20)
                        .padding(.bottom, 10)
                    

                    Spacer()
                }
                Spacer()
                
            }
        }
    }
}


// Vista previa con datos de personajes reales de Marvel
let ironMan = Character(id: 1009368, title: "Iron Man", name: "Iron Man", description: "Genius, billionaire, playboy, philanthropist.", thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/9/c0/527bb7b37ff55", thumbnailExtension: .jpg), resourceURI: "http://gateway.marvel.com/v1/public/characters/1009368", modified: "2023-11-17T12:00:00Z")

#Preview {
    MainRowView(character: ironMan)
}

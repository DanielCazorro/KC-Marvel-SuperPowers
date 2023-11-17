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
        
        VStack {
            // Aquí Deberá ir la foto del personaje
            Image(systemName: "photo")
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            VStack {
                Text("\(character.description)")
                    .padding(.top, 10)
                
                Spacer()
                
                ZStack {
                    Text("\(character.name)")
                        .bold()
                        .font(.title)
                        .foregroundColor(.orange)
                }
            }
        }
    }
}

let character1 = Character(id: 1, name: "Daniel", description: "The master, the only one who knows the true", thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/6/30/4ce69c2246c21", thumbnailExtension: "jpg"), resourceURI: "", modified: "")

#Preview {
    MainRowView(character: character1)
}

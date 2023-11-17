//
//  MainDetailView.swift
//  KC-Marvel-SuperPowers
//
//  Created by Daniel Cazorro Frías on 17/11/23.
//

import SwiftUI



struct MainDetailView: View {
    let character: Character // Recibe el héroe a mostrar
    
    var body: some View {
        VStack {
            // Muestra los detalles del héroe aquí
            Text(character.name)
                .font(.title)
            // Aquí se podrá mostrar la imagen del héroe si tenemos la URL de la imagen en el modelo
            Image(systemName: "photo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 250, height: 250)
            Text(character.description)
                .padding()
            
        }
        .navigationTitle(character.name)
    }
}

let character = Character(id: 123, name: "Spider-Man", description: "Friendly neighborhood superhero.", thumbnail: Thumbnail(path: "https://via.placeholder.com/150", thumbnailExtension: "jpg"), resourceURI: "", modified: "")

#Preview {
    MainDetailView(character: character)
}

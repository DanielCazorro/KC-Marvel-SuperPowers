//
//  HeroDetailView.swift
//  KC-Marvel-SuperPowers
//
//  Created by Daniel Cazorro Frías on 17/11/23.
//

import SwiftUI

let character = MarvelCharacter(
    id: 123,
    name: "Spider-Man",
    description: "Friendly neighborhood superhero.",
    thumbnailPath: "https://via.placeholder.com/150" // URL de la imagen del personaje
)


struct HeroDetailView: View {
    let hero: MarvelCharacter // Recibe el héroe a mostrar
    
    var body: some View {
        VStack {
            // Muestra los detalles del héroe aquí
            Text(hero.name)
                .font(.title)
            Text(hero.description)
                .padding()
            // Aquí se podrá mostrar la imagen del héroe si tenemos la URL de la imagen en el modelo
            Image(systemName: "photo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200, height: 200)
        }
        .navigationTitle(hero.name)
    }
}

#Preview {
    HeroDetailView(hero: character)
}

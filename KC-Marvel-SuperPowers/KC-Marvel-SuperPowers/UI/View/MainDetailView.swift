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
                .bold()
            // Aquí se podrá mostrar la imagen del héroe si tenemos la URL de la imagen en el modelo
            AsyncImage(url: URL(string: character.thumbnail.path)) { photo in
            // foto descragada
                photo
                    .resizable()
                    .cornerRadius(20)
                    .opacity(0.8)
                    .padding([.leading, .trailing], 10)
            } placeholder: {
                Image(systemName: "photo")
                    .resizable()
                    .cornerRadius(20)
                        .opacity(0.8)
            }
            
            // Description
            Text(character.description)
                .foregroundStyle(.gray)
                .font(.caption)
        }
        .navigationTitle(character.name)
    }
}

/*
#Preview {
    MainDetailView(character: character)
}
*/

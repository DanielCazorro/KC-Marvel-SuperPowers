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
        ScrollView {
            VStack {
                // Muestra el nombre del héroe arriba
                Text(character.name)
                    .foregroundStyle(.orange)
                    .font(.largeTitle)
                    .bold()
                    .padding(.top, 20)
                
                // Muestra la imagen del héroe si tenemos la URL de la imagen en el modelo
                AsyncImage(url: URL(string: "\(character.thumbnail.path).\(character.thumbnail.thumbnailExtension)")) { photo in
                    // foto descragada
                    photo
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(16)
                        //.opacity(0.8)
                        .padding([.leading, .trailing], 10)
                } placeholder: {
                    Image(systemName: "photo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(20)
                        .opacity(0.8)
                }
                .frame(width: 300, height: 300)
                
                // Muestra la descripción del héroe debajo de la imagen
                Text(character.description)
                    .foregroundStyle(.gray)
                    .font(.body)
                    .padding(.horizontal, 20)
                    //.multilineTextAlignment(.center)
                    .padding(.bottom, 20)
                
            }
        }
        .navigationBarTitle(character.name, displayMode: .inline)
        //.navigationTitle(character.name)
    }
}


/*
 #Preview {
 MainDetailView(character: character)
 }
 */

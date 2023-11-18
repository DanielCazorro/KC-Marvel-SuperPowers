//
//  MainRowView.swift
//  KC-Marvel-SuperPowers
//
//  Created by Daniel Cazorro Frías on 17/11/23.
//

import SwiftUI

struct MainRowView: View {
    let character: Character
    
    var body: some View {
        VStack {
            // Otros detalles del personaje...
            if let imageURL = URL(string: "\(character.thumbnail.path).\(character.thumbnail.thumbnailExtension ?? "jpg")") {
                AsyncImage(url: imageURL) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100, height: 100)
                } placeholder: {
                    // Placeholder mientras la imagen se carga
                    ProgressView()
                }
            } else {
                Text("URL de imagen incorrecta")
            }
        }
        .onAppear {
            if let imageURL = URL(string: "\(character.thumbnail.path).\(character.thumbnail.thumbnailExtension ?? "jpg")") {
                print("URL de imagen para \(character.name): \(imageURL)")
            }
        }
    }
}



/*
 #Preview {
 MainRowView(character: Character(id: 1, name: "Goku", description: "", thumbnail: Thumbnail(from: ), resourceURI: "", modified: ""))
 }
 */
/*
struct MainRowView: View {
    var character: Character
    
    var body: some View {
        
        ZStack {
            
            AsyncImage(url: URL(string: character.thumbnail.path)) { photo in
                photo
                    .resizable()
                    .cornerRadius(20)
                    .opacity(0.8)
                
            } placeholder: {
                ProgressView()
            }
            
            VStack(alignment: .leading) {
                // NAme
                HStack{
                    Text(character.name)
                        .font(.title2)
                        .foregroundStyle(.black)
                        .bold()
                        .padding([.top, .leading], 20)
                    Spacer()
                }
                Spacer()
                
            }
        }
    }
}
*/

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
                    .font(.title)
                    .bold()
                    .padding(.top, 20)
                
                // Muestra la imagen del héroe si tenemos la URL de la imagen en el modelo
                AsyncImage(url: URL(string: "\(character.thumbnail.path).\(character.thumbnail.thumbnailExtension)")) { photo in
                    // foto descragada
                    photo
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(20)
                        .opacity(0.9)
                        .padding([.leading, .trailing], 10)
                } placeholder: {
                    Image(systemName: "photo")
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(20)
                        .opacity(0.8)
                }
                .frame(width: 300, height: 300)
                
                // Muestra la descripción del héroe debajo de la imagen
                Text(character.description)
                    .foregroundStyle(.gray)
                    .font(.body)
                    .padding(.horizontal, 20)
                    .padding(.bottom, 20)
                
            }
        }
        .navigationBarTitle(character.name, displayMode: .inline)
        //.navigationTitle(character.name)
    }
}

let ironManDescription = "Iron Man, también conocido como Tony Stark, es uno de los personajes más icónicos de Marvel Comics. Este superhéroe ficticio apareció por primera vez en los cómics de Marvel en marzo de 1963, creado por el escritor Stan Lee, el guionista Larry Lieber, el dibujante Don Heck y el diseñador Jack Kirby. Tony Stark es un genio inventor, ingeniero y empresario multimillonario. Es reconocido por su intelecto prodigioso y su habilidad para desarrollar tecnología avanzada, especialmente su armadura de combate de alta tecnología, que él mismo diseña y construye. La armadura de Iron Man le otorga fuerza sobrehumana, vuelo, armas avanzadas y diversas capacidades defensivas. La historia de Iron Man es fascinante. Tony Stark inicialmente se ve obligado a crear la armadura para escapar de un secuestro. Posteriormente, decide utilizar su tecnología para luchar contra el crimen y proteger al mundo como Iron Man. A lo largo de su carrera como superhéroe, Stark enfrenta una serie de desafíos personales y profesionales, incluyendo la gestión de su empresa, Stark Industries, y su lucha con sus propios demonios internos. Además de ser un miembro destacado de los Vengadores, Iron Man ha sido parte integral de numerosas historias, eventos y crossover en el universo Marvel. Su evolución como héroe ha sido notable, mostrando no solo valentía en la lucha contra villanos, sino también un profundo sentido de responsabilidad y sacrificio por el bien mayor. La caracterización de Iron Man ha sido llevada al cine, interpretado magistralmente por el actor Robert Downey Jr. en el Universo Cinematográfico de Marvel, lo que ha contribuido significativamente a la popularidad del personaje en la cultura popular actual."

let character = Character(id: 2, name: "Iron Man", description: ironManDescription, thumbnail: Thumbnail(path: "https://i.blogs.es/0f256b/iron-man/450_1000", thumbnailExtension: .jpg), resourceURI: "https://www.example.com/character/2", modified: "2023-11-17T12:00:00Z")


 #Preview {
 MainDetailView(character: character)
 }
 


//
//  MainViewModel.swift
//  KC-Marvel-SuperPowers
//
//  Created by Daniel Cazorro Frías on 16/11/23.
//

import Foundation
import Combine

class MainViewModel: ObservableObject {
    @Published var characters: [Character] = [] // Contendrá todos los personajes
    private var offset = 0
    private let limit = 20
    private var suscriptor = Set<AnyCancellable>()
    
    init(testing: Bool = false) {
        if(testing) {
            getCharacterTest()
        } else {
            getCharacters()
        }
    }
    
    func getCharacters() {
        URLSession.shared
            .dataTaskPublisher(for: BaseNetwork().getSessionHero(offset: offset, limit: limit)) // Llama a getSessionHero con offset y limit
            .tryMap { output in
                guard let response = output.response as? HTTPURLResponse, response.statusCode == 200 else {
                    throw URLError(.badServerResponse)
                }
                return output.data // Retorna los datos recibidos
            }
            .decode(type: CharacterDataWrapper.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { _ in }) { data in
                self.characters = data.data.results // Actualiza los personajes con los datos recibidos
            }
            .store(in: &suscriptor)
    }
    

    func loadMoreCharacters() {
        offset += limit 
        getCharacters()
    }
    
    func filterCharacters(with searchText: String) {
        if searchText.isEmpty {
            // Si el texto de búsqueda está vacío, mostrar todos los personajes
            getCharacters()
        } else {
            // Filtrar personajes basados en el searchText
            self.characters = self.characters.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
        }
    }
    
    func getCharacterTest() {
        
        let ironManDescription = "Iron Man, también conocido como Tony Stark, es uno de los personajes más icónicos de Marvel Comics. Este superhéroe ficticio apareció por primera vez en los cómics de Marvel en marzo de 1963, creado por el escritor Stan Lee, el guionista Larry Lieber, el dibujante Don Heck y el diseñador Jack Kirby. Tony Stark es un genio inventor, ingeniero y empresario multimillonario. Es reconocido por su intelecto prodigioso y su habilidad para desarrollar tecnología avanzada, especialmente su armadura de combate de alta tecnología, que él mismo diseña y construye. La armadura de Iron Man le otorga fuerza sobrehumana, vuelo, armas avanzadas y diversas capacidades defensivas. La historia de Iron Man es fascinante. Tony Stark inicialmente se ve obligado a crear la armadura para escapar de un secuestro. Posteriormente, decide utilizar su tecnología para luchar contra el crimen y proteger al mundo como Iron Man. A lo largo de su carrera como superhéroe, Stark enfrenta una serie de desafíos personales y profesionales, incluyendo la gestión de su empresa, Stark Industries, y su lucha con sus propios demonios internos. Además de ser un miembro destacado de los Vengadores, Iron Man ha sido parte integral de numerosas historias, eventos y crossover en el universo Marvel. Su evolución como héroe ha sido notable, mostrando no solo valentía en la lucha contra villanos, sino también un profundo sentido de responsabilidad y sacrificio por el bien mayor. La caracterización de Iron Man ha sido llevada al cine, interpretado magistralmente por el actor Robert Downey Jr. en el Universo Cinematográfico de Marvel, lo que ha contribuido significativamente a la popularidad del personaje en la cultura popular actual."
        
         let character1 = Character(id: 1, name: "Iron Man", description: ironManDescription, thumbnail: Thumbnail(path: "https://i.blogs.es/0f256b/iron-man/450_1000", thumbnailExtension: .jpg), resourceURI: "https://www.example.com/character/2", modified: "2023-11-17T12:00:00Z")
         
         let character2 = Character(id: 2, name: "Spider-Man", description: "Your friendly neighborhood Spider-Man.", thumbnail: Thumbnail(path: "https://img2.rtve.es/i/?w=1600&i=1442912664626", thumbnailExtension: .jpg), resourceURI: "https://www.example.com/character/2", modified: "2023-11-17T12:00:00Z")
         
        let character3 = Character(id: 3, name: "Hulk", description: "Smash!", thumbnail: Thumbnail(path: "https://cdn.vegaoo.es/images/rep_art/gra/321/0/321071/figura-de-plastico-hulk-avengers-9-cm", thumbnailExtension: .jpg), resourceURI: "https://www.example.com/character/3", modified: "2023-11-17T12:00:00Z")

        let character4 = Character(id: 10, name: "Captain America", description: "Super-soldier and shield thrower.", thumbnail: Thumbnail(path: "https://cdn.hobbyconsolas.com/sites/navi.axelspringer.es/public/media/image/2014/07/351628-marvel-anuncia-nuevo-capitan-america", thumbnailExtension: .jpg), resourceURI: "https://www.example.com/character/10", modified: "2023-11-17T12:00:00Z")
         
        self.characters = [character1, character2, character3, character4]
        
    }
}

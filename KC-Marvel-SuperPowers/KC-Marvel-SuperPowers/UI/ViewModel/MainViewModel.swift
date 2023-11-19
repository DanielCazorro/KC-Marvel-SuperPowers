//
//  MainViewModel.swift
//  KC-Marvel-SuperPowers
//
//  Created by Daniel Cazorro Frías on 16/11/23.
//

import Foundation
import Combine

class MainViewModel: ObservableObject {
    @Published var characters: [Character]?
    
    private var suscriptor = Set<AnyCancellable>()
    
    init(testing: Bool = false) {
        if(testing) {
            getCharacterTest()
        } else {
            getCharacters(filter: "")
        }
    }
    
    func getCharacters(filter: String) {
        URLSession.shared
            .dataTaskPublisher(for: BaseNetwork().getSessionHero())
            .tryMap {
                guard let response = $0.response as? HTTPURLResponse,
                      response.statusCode == 200 else {
                    throw URLError(.badServerResponse)
                }
                return $0.data
            }
            .decode(type: CharacterDataWrapper.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .finished:
                    print("Finished receiving data")
                case .failure(let error):
                    print("Error receiving data: \(error)")
                }
            } receiveValue: { data in
                self.characters = data.data.results
                //print("Número de personajes recibidos: \(self.characters?.count ?? 0)")
                
                /*if let characters = self.characters {
                 for character in characters {
                 print("URL de imagen para \(character.name): \(character.thumbnail.path).\(character.thumbnail.thumbnailExtension ?? "")")
                 }
                 }*/
            }
            .store(in: &suscriptor)
    }
    
    func getCharacterTest() {
        
        
         let character1 = Character(id: 1, name: "Iron Man", description: "Geius, billionaire, playboy, philanthropist.", thumbnail: Thumbnail(path: "https://i.blogs.es/0f256b/iron-man/450_1000", thumbnailExtension: .jpg), resourceURI: "https://www.example.com/character/2", modified: "2023-11-17T12:00:00Z")
         
         let character2 = Character(id: 2, name: "Spider-Man", description: "Your friendly neighborhood Spider-Man.", thumbnail: Thumbnail(path: "https://img2.rtve.es/i/?w=1600&i=1442912664626", thumbnailExtension: .jpg), resourceURI: "https://www.example.com/character/2", modified: "2023-11-17T12:00:00Z")
         
        let character3 = Character(id: 3, name: "Hulk", description: "Smash!", thumbnail: Thumbnail(path: "https://cdn.vegaoo.es/images/rep_art/gra/321/0/321071/figura-de-plastico-hulk-avengers-9-cm", thumbnailExtension: .jpg), resourceURI: "https://www.example.com/character/3", modified: "2023-11-17T12:00:00Z")

        let character4 = Character(id: 10, name: "Captain America", description: "Super-soldier and shield thrower.", thumbnail: Thumbnail(path: "https://cdn.hobbyconsolas.com/sites/navi.axelspringer.es/public/media/image/2014/07/351628-marvel-anuncia-nuevo-capitan-america", thumbnailExtension: .jpg), resourceURI: "https://www.example.com/character/10", modified: "2023-11-17T12:00:00Z")
         
        self.characters = [character1, character2, character3, character4]
        
    }
}

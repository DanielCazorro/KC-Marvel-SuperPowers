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
        
        /*
        let character1 = Character(id: 1, name: "Daniel San", description: "The Master", thumbnail: Thumbnail(path: "https://pics.filmaffinity.com/Ip_Man-690169626-mmed.jpg", thumbnailExtension: "jpg"), resourceURI: "", modified: "")
        
        let character2 = Character(id: 2, name: "Hit-Monkey", description: "", thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/6/30/4ce69c2246c21", thumbnailExtension: "jpg"), resourceURI: "", modified: "")
        
        */
        self.characters = []
        
    }
}

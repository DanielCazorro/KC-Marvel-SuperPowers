//
//  MainViewModel.swift
//  KC-Marvel-SuperPowers
//
//  Created by Daniel Cazorro Frías on 16/11/23.
//

import Foundation
import Combine

class MainViewModel: ObservableObject {
    let interactor: HerosInteractorProtocol
    
    @Published var characters: [MarvelCharacter] = []
    
    init(interactor: HerosInteractorProtocol = HerosInteractor()) {
        self.interactor = interactor
    }
    
    func fetchHeroes() {
        interactor.getHeroes(filter: "")
            .sink(receiveCompletion: { completion in
                // Manejo de finalización o error
            }, receiveValue: { [weak self] marvelCharacters in
                self?.characters = marvelCharacters.data.results.map { characterData in
                    return MarvelCharacter(
                        id: characterData.id,
                        name: characterData.name,
                        description: characterData.description,
                        thumbnailPath: characterData.thumbnail.path
                    )
                }
            })
            .store(in: &cancellables)
    }
    
    
    private var cancellables = Set<AnyCancellable>()
}

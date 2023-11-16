//
//  HerosInteractor.swift
//  KC-Marvel-SuperPowers
//
//  Created by Daniel Cazorro Frías on 16/11/23.
//

import Foundation
import Combine

protocol HerosInteractorProtocol: AnyObject {
    func getHeros(filter: String) -> AnyPublisher<[MarvelCharacters], Error>
}

final class HerosInteractor: HerosInteractorProtocol {
    let networker: NetworkerProtocol
    let baseNetwork: BaseNetwork
    
    init(networker: NetworkerProtocol = Networker(), baseNetwork: BaseNetwork = BaseNetwork()) {
        self.networker = networker
        self.baseNetwork = baseNetwork
    }
    
    func getHeros(filter: String) -> AnyPublisher<[MarvelCharacters], Error> {
        return networker.callServer(type: [MarvelCharacters].self, request: baseNetwork.getSessionHero(filter: filter))
    }
}

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
    
    
    
    func getHeros(filter: String) -> AnyPublisher<[MarvelCharacters], Error> {
        <#code#>
    }
    
    
    
}

//
//  HerosViewModel.swift
//  KC-Marvel-SuperPowers
//
//  Created by Daniel Cazorro Frías on 16/11/23.
//

import Foundation
import Combine

final class HerosViewModel: ObservableObject {
    @Published var heros: [MarvelCharacters]?
    @Published var status = Status.loading
    
    var suscriptors = Set<AnyCancellable>()

    
    
}

//
//  MarvelCharacters.swift
//  KC-Marvel-SuperPowers
//
//  Created by Daniel Cazorro Frías on 16/11/23.
//

import Foundation

// Vamos a cambiar: Probaremos a utilizar los que se encuentra en public: v1/public/characters dentro de developermarvel

struct CharacterDataWrapper: Codable{
    let code: Int
    let status: String
    let copyright: String
    let attributionText: String
    let attributionHTML: String
    let etag: String
    let data: CharacterDataContainer
}

struct CharacterDataContainer: Codable {
    let offset: Int
    let limit: Int
    let total: Int
    let count: Int
    let results: [Character]
}

struct Character: Codable, Identifiable {
    let id: Int
    let name: String
    let description: String
    let thumbnail: Thumbnail // thumbnail (Image, optional): The representative image for this character.
    let resourceURI: String
    let modified: String
}

struct Thumbnail: Codable {
    let path: String
    let thumbnailExtension: String
}

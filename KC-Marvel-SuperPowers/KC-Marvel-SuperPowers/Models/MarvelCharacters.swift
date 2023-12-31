//
//  MarvelCharacters.swift
//  KC-Marvel-SuperPowers
//
//  Created by Daniel Cazorro Frías on 16/11/23.
//

import Foundation

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

struct Character: Codable, Identifiable, Equatable {
    let id: Int
    let name: String
    let description: String
    let thumbnail: Thumbnail // thumbnail (Image, optional): The representative image for this character.
    let resourceURI: String
    let modified: String
    
    static func == (lhs: Character, rhs: Character) -> Bool {
        return lhs.id == rhs.id // Implementa la lógica de comparación según lo necesario
    }
}

struct Thumbnail: Codable {
    let path: String
    var thumbnailExtension: jpg
    
    enum CodingKeys: String, CodingKey {
        case path
        case thumbnailExtension = "extension"
    }
    
    enum jpg: String, Codable {
        case jpg = "jpg"
    }
}

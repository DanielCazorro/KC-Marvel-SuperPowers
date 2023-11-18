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
    var thumbnailExtension: String?
    
    enum CodingKeys: String, CodingKey {
        case path
        case thumbnailExtension = "extension"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        path = try container.decode(String.self, forKey: .path)
        
        // Manejar el caso donde no hay una extensión proporcionada en la URL
        if let decodedExtension = try? container.decodeIfPresent(String.self, forKey: .thumbnailExtension) {
            thumbnailExtension = decodedExtension
        } else {
            thumbnailExtension = "jpg" // Establecer una extensión predeterminada
        }
    }
}

//
//  MarvelCharacters.swift
//  KC-Marvel-SuperPowers
//
//  Created by Daniel Cazorro Frías on 16/11/23.
//

import Foundation

// Estructura que representa el wrapper de los datos del personaje
struct CharacterDataWrapper: Codable{
    let code: Int
    let status: String
    let copyright: String
    let attributionText: String
    let attributionHTML: String
    let etag: String
    let data: CharacterDataContainer
}

// Estructura que representa el contenedor de los datos del personaje
struct CharacterDataContainer: Codable {
    let offset: Int
    let limit: Int
    let total: Int
    let count: Int
    let results: [Character]
}

// Estructura que representa un personaje
struct Character: Codable, Identifiable {
    let id: Int
    let title: String? // Título opcional del personaje
    let name: String // Nombre del personaje
    let description: String // Descripción del personaje
    let thumbnail: Thumbnail // Miniatura del personaje
    let resourceURI: String // URI de recursos del personaje
    let modified: String // Fecha de modificación del personaje
}

// Estructura que representa la miniatura del personaje
struct Thumbnail: Codable {
    let path: String // Ruta de la miniatura
    var thumbnailExtension: Extension // Extensión de la miniatura

    enum CodingKeys: String, CodingKey {
        case path
        case thumbnailExtension = "extension"
    }
    
    // Enumeración para las posibles extensiones de la miniatura
    enum Extension: String, Codable {
        case jpg = "jpg"
        case gif = "gif"
        case png = "png"
    }
}

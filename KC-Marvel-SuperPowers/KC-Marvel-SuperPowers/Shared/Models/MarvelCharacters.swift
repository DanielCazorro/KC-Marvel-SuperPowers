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

struct Character: Codable, Identifiable {
    let id: Int
    let title: String?
    let name: String
    let description: String
    let thumbnail: Thumbnail
    let resourceURI: String
    let modified: String
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
        case gif = "gif"
        case png = "png"
    }
}

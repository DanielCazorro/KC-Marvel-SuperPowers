//
//  BaseNetwork.swift
//  KC-Marvel-SuperPowers
//
//  Created by Daniel Cazorro Frías on 16/11/23.
//

import Foundation

// Dirección URL del servidor
let server = "https://gateway.marvel.com"

// Métodos del servidor
struct HTTPMethods {
    static let post = "POST"
    static let get = "GET"
    static let put = "PUT"
    static let delete = "DELETE"
    
    static let content = "application/json"
}

// Endpoints de la API
enum endpoints: String {
    case herosList = "/v1/public/characters"
    case comics = "/v1/public/comics"
    case creators = "/v1/public/creators"
    case events = "/v1/public/events"
    case series = "/v1/public/series"
    case stories = "/v1/public/stories"
    
}

enum paramsKeys: String {
    case publicKey = "c103d2622751066f8724a640dc83d26b"
    case ts = "1"
    case hash = "341fc6e22d3f05d92fece7a5ca724310"
    
}

struct BaseNetwork {
    func getSessionHero(offset: Int = 0, limit: Int = 20) -> URLRequest {
        let urlString = "https://gateway.marvel.com/v1/public/characters?apikey=c103d2622751066f8724a640dc83d26b&hash=341fc6e22d3f05d92fece7a5ca724310&ts=1&orderBy=-modified&offset=\(offset)&limit=\(limit)"
        
        guard let url = URL(string: urlString) else {
            fatalError("Invalid URL")
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = HTTPMethods.get
        
        return request
    }
}


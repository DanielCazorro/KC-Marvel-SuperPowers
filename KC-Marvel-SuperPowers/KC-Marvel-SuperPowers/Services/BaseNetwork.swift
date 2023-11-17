//
//  BaseNetwork.swift
//  KC-Marvel-SuperPowers
//
//  Created by Daniel Cazorro Frías on 16/11/23.
//

import Foundation

struct HTTPMethods {
    static let post = "POST"
    static let get = "GET"
    static let put = "PUT"
    static let delete = "DELETE"
    
    static let content = "application/json"
}

enum endpoints: String {
    
    case herosList = "/v1/public/characters"
    case comics = "v1/public/comics"
    case creators = "v1/public/creators"
    case events = "v1/public/events"
    case series = "v1/public/series"
    case stories = "v1/public/stories"
    
}

// FIXME: Esto no debería ir aquí seguramente, pero lo dejamos hasta que funcione la app y ya lo movemos: NUNCA PONER CLAVES EN EL CÓDIGO!!!
enum paramsKeys: String {
    case apiKey = "c103d2622751066f8724a640dc83d26b"
    case ts = "1"
    case hash = "341fc6e22d3f05d92fece7a5ca724310"
    
}

struct BaseNetwork {
    
    //FIXME: Comprboar este código
    func getSessionHero(filter: String) -> URLRequest{
        let urlCad = "\(server)\(endpoints.herosList.rawValue)"
        
        var request: URLRequest = URLRequest(url: URL(string: urlCad)!)
        request.httpMethod = HTTPMethods.get // FIXME: MIRAR AQUÍ QUE PUEDE SER POST
        
        request.httpBody = try? JSONEncoder().encode(MarvelCharactersFilter(name: filter))
        request.addValue(HTTPMethods.content, forHTTPHeaderField: "Content-type")
        
        return request
    }
}
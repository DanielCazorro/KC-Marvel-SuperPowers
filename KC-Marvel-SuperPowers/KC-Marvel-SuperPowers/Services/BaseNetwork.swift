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
    case comics = "/comics"
    case creators = "/v1/public/creators"
    case events = "/v1/public/events"
    case series = "/series"
    case stories = "/v1/public/stories"
    
}

enum paramsKeys: String {
    case publicKey = "c103d2622751066f8724a640dc83d26b"
    case ts = "1"
    case hash = "341fc6e22d3f05d92fece7a5ca724310"
    
}

struct BaseNetwork {
    func getSessionHero() -> URLRequest {
        let urlString = "https://gateway.marvel.com/v1/public/characters?apikey=c103d2622751066f8724a640dc83d26b&hash=341fc6e22d3f05d92fece7a5ca724310&ts=1&orderBy=-modified"
        
        guard let url = URL(string: urlString) else {
            fatalError("Invalid URL")
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = HTTPMethods.get
        
        return request
    }
    
    func getSessionSeries(idHero: Int) -> URLRequest {
        let url = URL(string: "\(server)\(endpoints.herosList.rawValue)/\(idHero)\(endpoints.series.rawValue)?apikey=\(paramsKeys.publicKey.rawValue)&ts=\(paramsKeys.ts.rawValue)&hash=\(paramsKeys.hash.rawValue)&orderBy=-modified")
        
        var request = URLRequest(url: url!)
        request.httpMethod = HTTPMethods.get
        print("SESION Request: \(request)")
        return request
    }
}


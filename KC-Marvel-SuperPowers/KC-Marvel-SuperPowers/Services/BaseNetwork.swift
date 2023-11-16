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
}

struct BaseNetwork {
    
    func getSessionHero(filter: String) -> URLRequest{
        let urlCad = "\(server)\(endpoints.herosList.rawValue)"
        
        var request: URLRequest = URLRequest(url: URL(string: urlCad)!)
        request.httpMethod = HTTPMethods.get // FIXME: MIRAR AQUÍ QUE PUEDE SER POST
        
        request.httpBody = try? JSONEncoder().encode(MarvelCharactersFilter(name: filter))
        request.addValue(HTTPMethods.content, forHTTPHeaderField: "Content-type")
        
        return request
    }
}

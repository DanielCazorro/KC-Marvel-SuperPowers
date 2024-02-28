//
//  BaseNetwork.swift
//  KC-Marvel-SuperPowers
//
//  Created by Daniel Cazorro Frías on 16/11/23.
//

import Foundation

// URL base del servidor Marvel
let marvelServer = "https://gateway.marvel.com"

// Métodos HTTP compatibles
struct HTTPMethods {
    static let get = "GET"
    
    // Tipo de contenido JSON
    static let content = "application/json"
}

// Endpoints de la API de Marvel
enum endpoints: String {
    case herosList = "/v1/public/characters"
    case series = "/series"
}

// Claves de los parámetros para la autenticación en la API de Marvel
enum paramsKeys: String {
    case publicKey = "c103d2622751066f8724a640dc83d26b"
    case ts = "1"
    case hash = "341fc6e22d3f05d92fece7a5ca724310"
    
}

struct BaseNetwork {
    /// Función para obtener una URL construida con el endpoint y un subpath opcional para las series
    private func getURL(endpoint:String, subPath:String = "", offset: Int? = nil, limit: Int? = nil) -> String{
        var url = marvelServer
        
        url += "\(endpoint)\(subPath)"
        url += "?apikey=\(paramsKeys.publicKey.rawValue)"
        url += "&ts=\(paramsKeys.ts.rawValue)"
        url += "&hash=\(paramsKeys.hash.rawValue)"
        
        if let offset = offset, let limit = limit {
            url += "&offset=\(offset)&limit=\(limit)"
        }
        
        return url
    }
    
    /// Función para obtener una solicitud de sesión para obtener la lista de héroes
    func getSessionHero(offset: Int = 0, limit: Int = 20) -> URLRequest {
        // Construimos la URL para obtener la lista de héroes, ordenada por fecha de modificación descendente
        var urlStr: String = getURL(endpoint: endpoints.herosList.rawValue, offset: offset, limit: limit)
        urlStr += "&orderBy=-modified"
        
        // Creamos la solicitud URLRequest
        var request: URLRequest = URLRequest(url: URL(string: urlStr)!)
        request.httpMethod = HTTPMethods.get
        request.addValue(HTTPMethods.content, forHTTPHeaderField: "Content-type")
        print(request)
        return request
    }
    
    
    /// Función para obtener una solicitud de sesión para obtener las series de un héroe específico
    func getSessionSeries(idHero: Int) -> URLRequest {
        // Construimos la URL para obtener las series de un héroe específico, ordenadas por fecha de modificación descendente
        var urlStr: String = getURL(endpoint: endpoints.herosList.rawValue, subPath: "/\(idHero)/series")
        urlStr += "&orderBy=-modified"
        
        // Creamos la solicitud URLRequest
        var request: URLRequest = URLRequest(url: URL(string: urlStr)!)
        request.httpMethod = HTTPMethods.get
        request.addValue(HTTPMethods.content, forHTTPHeaderField: "Content-type") // Se añade el encabezado para indicar el tipo de contenido JSON
        return request
    }
}

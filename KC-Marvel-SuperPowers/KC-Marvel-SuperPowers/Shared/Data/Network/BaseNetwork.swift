//
//  BaseNetwork.swift
//  KC-Marvel-SuperPowers
//
//  Created by Daniel Cazorro Frías on 16/11/23.
//

import Foundation

// URL base del servidor Marvel
let server = "https://gateway.marvel.com"

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
    /// Función para obtener una solicitud de sesión para obtener la lista de héroes
    func getSessionHero() -> URLRequest {
        let urlString = "https://gateway.marvel.com/v1/public/characters?apikey=c103d2622751066f8724a640dc83d26b&hash=341fc6e22d3f05d92fece7a5ca724310&ts=1&orderBy=-modified"
        
        // Convertir la URL de cadena a objeto URL
        guard let url = URL(string: urlString) else {
            fatalError("Invalid URL")
        }
        
        // Crear y configurar la solicitud URL
        var request = URLRequest(url: url)
        request.httpMethod = HTTPMethods.get
        
        return request
    }
    
    /// Función para obtener una solicitud de sesión para obtener las series de un héroe específico
    func getSessionSeries(idHero: Int) -> URLRequest {
        // Construir la URL con el ID del héroe para obtener sus series
        let url = URL(string: "\(server)\(endpoints.herosList.rawValue)/\(idHero)\(endpoints.series.rawValue)?apikey=\(paramsKeys.publicKey.rawValue)&ts=\(paramsKeys.ts.rawValue)&hash=\(paramsKeys.hash.rawValue)&orderBy=-modified")
        
        // Crear y configurar la solicitud URL
        var request = URLRequest(url: url!)
        request.httpMethod = HTTPMethods.get
        
        return request
    }
}

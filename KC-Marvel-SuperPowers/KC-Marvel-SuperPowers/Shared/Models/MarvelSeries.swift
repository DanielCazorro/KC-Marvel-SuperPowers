//
//  MarvelSeries.swift
//  KC-Marvel-SuperPowers
//
//  Created by Daniel Cazorro Frías on 27/2/24.
//

import Foundation

// Estructura que representa el wrapper de los datos de la serie
struct SeriesDataWrapper: Codable {
    let code: Int
    let status: String
    let copyright: String
    let attributionText: String
    let attributionHTML: String
    let etag: String
    let data: SeriesDataContainer
}

// Estructura que contiene los datos de la serie
struct SeriesDataContainer: Codable {
    let offset: Int
    let limit: Int
    let total: Int
    let count: Int
    let results: [Series]
}

// Estructura que representa una serie
struct Series: Codable, Identifiable {
    let id: Int
    let title: String // Título de la serie
    let description: String? // Descripción opcional de la serie
    let resourceURI: String // URI de recursos de la serie
    let startYear: Int // Año de inicio de la serie
    let endYear: Int // Año de fin de la serie
    let rating: String // Calificación de la serie
    let modified: String // Fecha de modificación de la serie
    let thumbnail: Thumbnail // Miniatura de la serie
}

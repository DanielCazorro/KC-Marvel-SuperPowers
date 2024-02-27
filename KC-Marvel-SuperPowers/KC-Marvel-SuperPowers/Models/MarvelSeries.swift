//
//  MarvelSeries.swift
//  KC-Marvel-SuperPowers
//
//  Created by Daniel Cazorro Frías on 27/2/24.
//

import Foundation

struct SeriesDataWrapper: Codable {
    let code: Int
    let status: String
    let copyright: String
    let attributionText: String
    let attributionHTML: String
    let etag: String
    let data: SeriesDataContainer
}

struct SeriesDataContainer: Codable {
    let offset: Int
    let limit: Int
    let total: Int
    let count: Int
    let results: [Series]
}

struct Series: Codable, Identifiable {
    let id: Int
    let title: String
    let description: String
    let resourceURI: String
    let startYear: Int
    let endYear: Int
    let rating: String
    let modified: String
    let thumbnail: Thumbnail
}

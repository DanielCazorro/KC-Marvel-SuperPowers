//
//  SeriesViewModel.swift
//  KC-Marvel-SuperPowers
//
//  Created by Daniel Cazorro Frías on 27/2/24.
//

import Foundation
import Combine
import SwiftUI

class SeriesViewModel: ObservableObject {
    
    @Published var series: [Series]? // Array de series

    private var suscriptor = Set<AnyCancellable>() // Suscriptor para gestionar las suscripciones

    // Inicializador del view model
    init(testing: Bool = false, idHero: Int){
        if(testing) {
            getSeriesTest() // Si estamos en modo de prueba, obtenemos las series de prueba
        } else {
            getSeries(idHero: idHero) // Si no estamos en modo de prueba, obtenemos las series del héroe especificado
        }
    }
    
    // Función para obtener las series de prueba
    func getSeriesTest() {
        // Crear una serie de prueba con datos reales
        let seriesData: [Series] = [
            Series(id: 123, title: "Spider-Man: Far From Home Prelude (2019)", description: "Get ready for this summer's Spider-Man: Far From Home with this adaptation of the smash-hit Spider-Man: Homecoming!", resourceURI: "", startYear: 2019, endYear: 2019, rating: "", modified: "2023-11-17T12:00:00Z", thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/b/40/image_not_available", thumbnailExtension: .jpg)),
            Series(id: 456, title: "Amazing Spider-Man Vol. 5: Spiral (2020)", description: "There's a new Sinister Syndicate! Beetle, Electro, Lady Octopus, Scorpia and White Rabbit have come together for one reason: TO HUNT BOOMERANG!", resourceURI: "", startYear: 2020, endYear: 2020, rating: "", modified: "2023-11-17T12:00:00Z", thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/b/40/image_not_available", thumbnailExtension: .jpg)),
            Series(id: 789, title: "Black Widow: Widow's Sting (2020)", description: "Something's stirring in the criminal underworld. Maggia boss SILVERMANE is making his move. S.H.I.E.L.D. has sent an agent in to investigate, but they've disappeared.", resourceURI: "", startYear: 2020, endYear: 2020, rating: "", modified: "2023-11-17T12:00:00Z", thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/b/40/image_not_available", thumbnailExtension: .jpg))
        ]
        
        // Asignar las series de prueba al array de series
        self.series = seriesData
    }
    
    // Función para obtener las series del héroe especificado
    func getSeries(idHero: Int) {
        // Realizar una solicitud de red para obtener las series del héroe
        URLSession.shared
            .dataTaskPublisher(for: BaseNetwork().getSessionSeries(idHero: idHero))
            .tryMap { data, response in
                // Verificar si la respuesta es válida (código de estado 200)
                guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                    throw URLError(.badServerResponse)
                }
                return data // Devolver los datos si la respuesta es válida
            }
            .decode(type: SeriesDataWrapper.self, decoder: JSONDecoder()) // Decodificar los datos recibidos
            .receive(on: DispatchQueue.main) // Recibir en el hilo principal para actualizar la interfaz de usuario
            .sink(receiveCompletion: { completion in
                // Manejar el estado de finalización de la solicitud
                switch completion {
                case .finished:
                    print("Finished loading series") // Imprimir mensaje de éxito al cargar las series
                case .failure(let error):
                    print("Error loading series: \(error)") // Imprimir mensaje de error si falla la carga de las series
                }
            }, receiveValue: { data in
                // Asignar las series obtenidas al array de series
                self.series = data.data.results
            })
            .store(in: &suscriptor) // Almacenar la suscripción en el conjunto de suscriptores
    }
}

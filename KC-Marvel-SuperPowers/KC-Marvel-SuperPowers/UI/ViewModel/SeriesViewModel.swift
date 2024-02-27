//
//  SeriesViewModel.swift
//  KC-Marvel-SuperPowers
//
//  Created by Daniel Cazorro Frías on 27/2/24.
//

import Foundation
import Combine

class SeriesViewModel: ObservableObject {
    
    @Published var series: [Series]?
    
    private var suscriptor = Set<AnyCancellable>()
    
    init(testing: Bool = false, idHero: Int){
        if(testing) {
            getSeriesTest()
        } else {
            getSeries(idHero: idHero)
        }
    }
    
    
    func getSeriesTest() {
        let serie = Series(id: 1234, title: "Daniel", description: "The boss of the team", resourceURI: "", startYear: 1992, endYear: 2120, rating: "",
               modified: "2023-11-17T12:00:00Z", thumbnail: Thumbnail(path: "http://i.åannihil.us/u/prod/marvel/i/mg/b/40/image_not_available", thumbnailExtension: .jpg))
        
        self.series = [serie]
    }
    
    func getSeries(idHero: Int) {
        
        URLSession.shared
            .dataTaskPublisher(for: BaseNetwork().getSessionSeries(idHero: idHero))
            .tryMap {
                guard let response = $0.response as? HTTPURLResponse,
                      response.statusCode == 200 else {
                    throw URLError(.badServerResponse)
                }
                return $0.data
            }
            .decode(type: SeriesDataWrapper.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .finished:
                    print("Finished")
                case .failure(let error):
                    print("Error: \(error)")
                }
            } receiveValue: { data in
                self.series = data.data.results
                print("Data: \(data)")
            }
            .store(in: &suscriptor)
    }
}

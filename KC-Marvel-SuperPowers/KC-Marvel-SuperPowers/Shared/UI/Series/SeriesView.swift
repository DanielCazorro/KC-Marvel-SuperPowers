//
//  SeriesView.swift
//  KC-Marvel-SuperPowers
//
//  Created by Daniel Cazorro Frías on 27/2/24.
//

import SwiftUI

struct SeriesView: View {
    @StateObject var seriesViewModel: SeriesViewModel
    
    var body: some View {
        NavigationStack {
            List {
                if let series = seriesViewModel.series {
                    // Verificar si se cargaron las series
                    Text("Series count: \(series.count)")
                    
                    ForEach(series) { serie in
                        NavigationLink {
                            // Vista a la que navegamos
                            MainView()
                        } label: {
                            SeriesRowView(serie: serie)
                        }
                    }
                } else {
                    // Verificar si no se cargaron las series
                    Text("No series loaded")
                }
            }
        }
    }
}


#Preview {
    SeriesView(seriesViewModel: SeriesViewModel( idHero: 1))
}

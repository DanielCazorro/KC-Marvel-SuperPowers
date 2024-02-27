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
        NavigationView {
            List {
                if let series = seriesViewModel.series {
                    // Verificar si se cargaron las series
                    ForEach(series) { serie in
                        SeriesRowView(serie: serie)
                    }
                } else {
                    // Verificar si no se cargaron las series
                    Text("No series loaded")
                }
            }
            .navigationTitle("Series")
            .navigationBarTitleDisplayMode(.inline) // Ajustar el tamaño de la barra de navegación
        }
    }
}


#Preview {
    SeriesView(seriesViewModel: SeriesViewModel( idHero: 1))
}

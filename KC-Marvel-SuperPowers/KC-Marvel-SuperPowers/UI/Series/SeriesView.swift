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
                    
                }
            }
        }
    }
}



#Preview {
    SeriesView(seriesViewModel: SeriesViewModel( idHero: 1))
}

//
//  MainView.swift
//  KC-Marvel-SuperPowers
//
//  Created by Daniel Cazorro Frías on 16/11/23.
//

import SwiftUI

struct MainView: View {
    @StateObject var mainViewModel: MainViewModel = MainViewModel()
    @State private var filter: String = ""
    
    var body: some View {
        NavigationView {
            List(mainViewModel.characters) { character in
                NavigationLink {
                    SeriesView(seriesViewModel: SeriesViewModel(idHero: character.id))
                } label: {
                    MainRowView(character: character)
                        .aspectRatio(contentMode: .fit)
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 200, maxHeight: 200)
                        .clipped() // Recorta la imagen para que no se extienda más allá de la celda
                        .presentationCornerRadius(8)
                        .shadow(radius: 5)
                        .padding(5)
                        .background(Color.clear)
                        .shadow(color: Color.black.opacity(0.8), radius: 4, x: 0, y: 4)
                        .transition(.move(edge: .leading))
                }
            }
            .listStyle(PlainListStyle())
            .padding(.horizontal)
            .background(Color.clear)
            .navigationTitle("Marvel Characters")
        }
    }
}

#Preview {
    MainView(mainViewModel: MainViewModel(testing: false))
}

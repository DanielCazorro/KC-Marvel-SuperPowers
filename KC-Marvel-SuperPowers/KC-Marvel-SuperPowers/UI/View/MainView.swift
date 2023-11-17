//
//  MainView.swift
//  KC-Marvel-SuperPowers
//
//  Created by Daniel Cazorro Frías on 16/11/23.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel: MainViewModel = MainViewModel() // Inicializa @StateObject
    
    var body: some View {
        NavigationView {
            List(viewModel.characters, id: \.id) { character in
                NavigationLink(destination: HeroDetailView(hero: character)) {
                    HStack {
                        // Muestra la información del héroe en cada fila de la lista
                        Image(systemName: "person.fill")
                            .frame(width: 50, height: 50) // TODO: Reemplazar esto con la imagen real del héroe
                        Text(character.name)
                    }
                }
            }
            .navigationTitle("Marvel Characters")
            // Llama al método para cargar los héroes cuando aparece la vista
            .onAppear {
                viewModel.fetchHeroes()
            }
        }
    }
}

#Preview {
    MainView()
}

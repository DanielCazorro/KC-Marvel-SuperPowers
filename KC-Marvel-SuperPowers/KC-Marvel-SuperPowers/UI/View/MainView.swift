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
            List {
                if let characters = mainViewModel.characters {
                    ForEach(characters) { character in
                        NavigationLink {
                            MainDetailView(character: character)
                        } label: {
                            MainRowView(character: character)
                                .frame(height: 180)
                                .padding(.vertical, 8)
                                .background(Color.clear)
                                .cornerRadius(25)
                                .shadow(color: Color.black.opacity(0.2), radius: 8, x: 0, y: 4)
                                .transition(.move(edge: .leading))
                        }
                    }
                }
            }
            .listStyle(PlainListStyle())
            .padding(.horizontal)
            .background(Color.clear)
            .navigationTitle("Marvel")
        }
        .searchable(text: $filter,
                    placement: .navigationBarDrawer(displayMode: .automatic),
                    prompt: "Search Characters")
        .onChange(of: filter) { oldValue, newValue in
            //Ha cambiado el filtro de búsqueda
            mainViewModel.getCharacters()
        }
    }
}

#Preview {
    MainView(mainViewModel: MainViewModel(testing: false))
}

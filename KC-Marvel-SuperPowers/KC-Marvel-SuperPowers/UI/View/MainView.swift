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
        
        NavigationStack{
            List{
                if let characters = mainViewModel.characters {
                    ForEach(characters) { character in
                        NavigationLink {
                            MainDetailView(character: character)
                        } label: {
                            MainRowView(character: character)
                                .frame(height: 200)
                        }
                    }
                }
            }
            .navigationTitle("Marvel")
        }
        .searchable(text: $filter,
                    placement: .navigationBarDrawer(displayMode: .automatic),
                    prompt: "Search Characters")
        .onChange(of: filter) { oldValue, newValue in
            //Ha cambiado el filtro de busqueda
            mainViewModel.getCharacters()
        }
    }
}

#Preview {
    MainView(mainViewModel: MainViewModel(testing: false))
}

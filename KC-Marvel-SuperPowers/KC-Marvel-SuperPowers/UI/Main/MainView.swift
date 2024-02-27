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
//                    MainDetailView(character: character)
                } label: {
                    MainRowView(character: character)
                        .frame(height: 225)
                        .padding(.vertical, 8)
                        .background(Color.clear)
                        .cornerRadius(25)
                        .shadow(color: Color.black.opacity(0.8), radius: 4, x: 0, y: 4)
                        .transition(.move(edge: .leading))
                }
            }
            .listStyle(PlainListStyle())
            .padding(.horizontal)
            .background(Color.clear)
            .navigationTitle("Marvel Characters")
        }
        .searchable(text: $filter,
                    placement: .navigationBarDrawer(displayMode: .automatic),
                    prompt: "Search Characters")
        .onChange(of: filter) { oldValue, newValue in
            mainViewModel.filterCharacters(with: newValue)
        }
    }
}

#Preview {
    MainView(mainViewModel: MainViewModel(testing: false))
}

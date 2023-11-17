//
//  MainView.swift
//  KC-Marvel-SuperPowers
//
//  Created by Daniel Cazorro Frías on 16/11/23.
//

import SwiftUI

struct MainView: View {
    @StateObject var mainViewModel: MainViewModel = MainViewModel()
    
    var body: some View {
        
        NavigationStack{
            List{
                if let characters = mainViewModel.characters {
                    ForEach(characters) { character in
                        NavigationLink {
                            MainDetailView(character: character)
                        } label: {
                            MainRowView(character: character)
                        }
                    }
                }
            }
            .navigationTitle("Marvel")
        }
    }
}

#Preview {
    MainView(mainViewModel: MainViewModel(testing: true))
}

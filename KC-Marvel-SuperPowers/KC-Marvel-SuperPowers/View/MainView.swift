//
//  MainView.swift
//  KC-Marvel-SuperPowers
//
//  Created by Daniel Cazorro Frías on 16/11/23.
//

import SwiftUI

struct MainView: View {
    @State private var filter: String = ""
    
    var body: some View {
        NavigationStack {
            List{
                
            }
            .navigationTitle("Marvel Characters")
            
            .searchable(text: $filter,
                        placement: .navigationBarDrawer(displayMode: .always),
                        prompt: "Search Characters...")

            
        }
    }
}

#Preview {
    MainView()
}

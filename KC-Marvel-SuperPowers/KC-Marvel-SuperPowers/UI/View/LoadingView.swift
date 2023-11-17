//
//  LoadingView.swift
//  KC-Marvel-SuperPowers
//
//  Created by Daniel Cazorro Frías on 16/11/23.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ZStack {
            
            Image(decorative: "MarvelLoading")
                .resizable()
                .scaledToFit()
            
        }
        Text("LOADING")
            .underline()
            .bold()
            .font(.title)
            .foregroundStyle(.orange)
            .padding()
        
        ProgressView()
    }
}

#Preview {
    LoadingView()
}

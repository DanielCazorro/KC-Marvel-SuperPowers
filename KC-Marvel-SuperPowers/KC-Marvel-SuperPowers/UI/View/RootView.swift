//
//  RootView.swift
//  KC-Marvel-SuperPowers
//
//  Created by Daniel Cazorro Frías on 16/11/23.
//

import SwiftUI

struct RootView: View {
    @EnvironmentObject var rootViewModel: RootViewModel
    
    @State private var isLoading = true // Nuevo estado para simular carga
    
    var body: some View {
        Group {
            if isLoading {
                LoadingView()
                    .onAppear {
                        // Simular carga durante 2 segundos
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            isLoading = false
                            rootViewModel.status = .loaded
                        }
                    }
            } else {
                switch rootViewModel.status {
                case .error(error: let errorString):
                    Text("TODO: ERRORVIEW \(errorString)")
                    
                case .loaded:
                    MainView()
                default:
                    EmptyView()
                }
            }
        }
    }
}

#Preview {
    RootView()
        .environmentObject(RootViewModel())
}

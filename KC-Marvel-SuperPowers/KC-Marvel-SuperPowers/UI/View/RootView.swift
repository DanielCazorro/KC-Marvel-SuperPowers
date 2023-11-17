//
//  RootView.swift
//  KC-Marvel-SuperPowers
//
//  Created by Daniel Cazorro Frías on 16/11/23.
//

import SwiftUI

struct RootView: View {
    // Preparamos para poder usar los estados
    @EnvironmentObject var rootViewModel: RootViewModel
    
    @State private var isLoading = true // Nuevo estado para simular carga
    
    var body: some View {
        Group {
            
            // Comprobamos si la variable isLoading es true o false
            if isLoading {
                LoadingView()
                    .onAppear {
                        // Simular carga durante 2 segundos
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            // Cambiamos a false par que entre en else
                            isLoading = false
                            // Cambiamos el estado del rootViewModel para que enre en la MainView
                            rootViewModel.status = .loaded
                        }
                    }
            } else {
                
                // Realizamos un switch con los casos error y loaded
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

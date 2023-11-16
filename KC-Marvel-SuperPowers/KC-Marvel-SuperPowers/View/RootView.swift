//
//  RootView.swift
//  KC-Marvel-SuperPowers
//
//  Created by Daniel Cazorro Frías on 16/11/23.
//

import SwiftUI

struct RootView: View {
    @EnvironmentObject var rootViewModel: RootViewModel
    
    var body: some View {
        switch rootViewModel.status{
        case Status.log:
            Text("TODO: LOG VIEW")
            
        case .loading:
            Text("TODO: LOADING")
            
        case .error(error: let errorString):
            withAnimation {
                Text("TODO: ERRORVIEW \(errorString)")
            }
            
        case .loaded:
            withAnimation {
                Text("TODO: MAIN VIEW")
            }
        }
    }
}

#Preview {
    RootView()
}

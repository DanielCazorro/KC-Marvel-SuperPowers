//
//  KC_Marvel_SuperPowersApp.swift
//  KC-Marvel-SuperPowers
//
//  Created by Daniel Cazorro Frías on 10/11/23.
//

import SwiftUI

@main
struct KC_Marvel_SuperPowersApp: App {
    @StateObject var mainViewModel = MainViewModel()
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(mainViewModel)
        }
    }
}

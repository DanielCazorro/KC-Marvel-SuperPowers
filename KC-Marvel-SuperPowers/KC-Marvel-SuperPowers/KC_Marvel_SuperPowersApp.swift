//
//  KC_Marvel_SuperPowersApp.swift
//  KC-Marvel-SuperPowers
//
//  Created by Daniel Cazorro Frías on 10/11/23.
//

import SwiftUI

@main
struct KC_Marvel_SuperPowersApp: App {
    let persistenceController = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}

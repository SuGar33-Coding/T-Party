//
//  T_PartyApp.swift
//  T-Party
//
//  Created by Gabriel Klavans on 10/10/22.
//

import SwiftUI

@main
struct TPartyApp: App {
    @State private var preferences = Preferences()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(preferences)
        }
    }
}

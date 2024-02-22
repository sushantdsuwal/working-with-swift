//
//  FinderApp.swift
//  Finder
//
//  Created by Sushant Suwal on 22/02/2024.
//

import SwiftUI

@main
struct FinderApp: App {
    
    @State private var appState = AppState();
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(appState)
        }
    }
}

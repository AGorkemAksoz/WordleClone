//
//  WordleCloneApp.swift
//  WordleClone
//
//  Created by Gorkem on 9.01.2025.
//

import SwiftUI

@main
struct WordleCloneApp: App {
    @StateObject var dm = WordleDataModel()
    @StateObject var csManager = ColorSchemeManager()
    var body: some Scene {
        WindowGroup {
            GameView()
                .environmentObject(dm)
                .environmentObject(csManager)
                .onAppear {
                    csManager.applyColorScheme()
                }
        }
    }
}

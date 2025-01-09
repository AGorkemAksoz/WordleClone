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
    var body: some Scene {
        WindowGroup {
            GameView()
                .environmentObject(dm)
        }
    }
}

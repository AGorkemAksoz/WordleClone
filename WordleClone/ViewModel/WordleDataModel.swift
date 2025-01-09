//
//  WordleDataModel.swift
//  WordleClone
//
//  Created by Gorkem on 9.01.2025.
//

import SwiftUI

class WordleDataModel: ObservableObject {
    @Published var guesses: [Guess] = []
    
    init() {
        newGame()
    }
    
    func newGame() {
        populateDefaults()
    }
    
    private func populateDefaults() {
        guesses = []
        for index in 0...5 {
            guesses.append(Guess(index: index))
        }
    }
}

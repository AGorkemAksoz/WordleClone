//
//  Guess.swift
//  WordleClone
//
//  Created by Gorkem on 9.01.2025.
//

import SwiftUI

struct Guess {
    let index: Int
    var word = "     "
    var bgColors = [Color](repeating: .wrong, count: 5)
    var carFlipped = [Bool](repeating: false, count: 5)
    var guessLetters: [String] {
        word.map { String($0)}
    }
    
    var results: String {
        let tryColors: [Color: String] = [.misplaced: "🟨", .correct: "🟩", .wrong: "⬛️"]
        return bgColors.compactMap { tryColors[$0]}.joined(separator: "")
    }
}

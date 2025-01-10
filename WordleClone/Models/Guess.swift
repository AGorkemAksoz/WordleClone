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
}

//
//  GuessView.swift
//  WordleClone
//
//  Created by Gorkem on 9.01.2025.
//

import SwiftUI

struct GuessView: View {
    @Binding var guess: Guess
    var body: some View {
        HStack(spacing: 3) {
            ForEach(0...4, id: \.self) { index in
                FlipView(isFlipped: $guess.carFlipped[index]) {
                    Text(guess.guessLetters[index])
                        .foregroundStyle(.primary)
                        .frame(minWidth: 0,
                               maxWidth: .infinity,
                               minHeight: 0,
                               maxHeight: .infinity,
                               alignment: .center)
                        .background(Color.systemBackground)
                } back: {
                    Text(guess.guessLetters[index])
                        .foregroundStyle(.white)
                        .frame(minWidth: 0,
                               maxWidth: .infinity,
                               minHeight: 0,
                               maxHeight: .infinity,
                               alignment: .center)
                        .background(guess.bgColors[index])
                }
                .font(.system(size: 35, weight: .heavy))
                .border(Color(.secondaryLabel))
            }
        }
    }
}

#Preview {
    GuessView(guess: .constant(Guess(index: 0)))
}

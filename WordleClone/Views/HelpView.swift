//
//  HelpView.swift
//  WordleClone
//
//  Created by Ali Görkem Aksöz on 12.01.2025.
//

import SwiftUI

struct HelpView: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                Text(
"""
Guess the **WORDLE** in 6. tries\n
Each guess must be a valid 5 letter word. Hit the enter button to submit.\n
After each guess, the color of the tiles will change to show how close your guess was to the word.\n
"""
                )
                Divider()
                Text("**Examples**")
                Image("Weary")
                    .resizable()
                     .scaledToFit()
                Text("The letter **W** is in the word and in the correct spot\n")
                
                Image("Pills")
                    .resizable()
                     .scaledToFit()
                Text("The letter **I** is in the word but in the wrong spot\n")
                
                Image("Vague")
                    .resizable()
                     .scaledToFit()
                Text("The letter **U** is not in the word in any spot\n")
                Divider()
                Text("**Tap the NEW Button for a new WORDLE.**")
                Spacer()
                
            }
            .frame(width: min(Global.screenWidth - 40, 350))
            .navigationTitle("HOW TO PLAY")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        dismiss()
                    } label: {
                        Text("**X**")
                    }
                }
            }
        }
    }
}

#Preview {
    HelpView()
}

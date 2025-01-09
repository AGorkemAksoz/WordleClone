//
//  GameView.swift
//  WordleClone
//
//  Created by Gorkem on 9.01.2025.
//

import SwiftUI

struct GameView: View {
    @EnvironmentObject var dm: WordleDataModel
    var body: some View {
        NavigationStack {
            VStack(spacing: 3) {
                ForEach(0...5, id: \.self) { index in
                    GuessView(guess: $dm.guesses[index])
                }
            }
            .frame(width: Global.boardWidth, height: 6 * Global.boardWidth / 5)
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button {
                            
                        } label: {
                            Image(systemName: "questionmark.circle")
                        }
                    }
                    ToolbarItem(placement: .principal) {
                        Text("WORDLE")
                            .font(.largeTitle)
                            .fontWeight(.heavy)
                            .foregroundStyle(.primary)
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        HStack {
                            Button {
                                
                            } label: {
                                Image(systemName: "chart.bar")
                            }
                            Button {
                                
                            } label: {
                                Image(systemName: "gearshape.fill")
                            }
                        }
                    }
                }
        }
    }
}

#Preview {
    GameView()
        .environmentObject(WordleDataModel())
}

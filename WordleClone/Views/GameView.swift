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
        ZStack {
            NavigationStack {
                VStack {
                    Spacer()
                    VStack(spacing: 3) {
                        ForEach(0...5, id: \.self) { index in
                            GuessView(guess: $dm.guesses[index])
                                .modifier(Shake(animatableData: CGFloat(dm.incorrectAttemps[index])))
                        }
                    }
                    .frame(width: Global.boardWidth, height: 6 * Global.boardWidth / 5)
                    Spacer()
                    Keyboard()
                        .scaleEffect(Global.keyboardScale)
                        .padding(.top)
                    
                    Spacer()
                }
                    .navigationBarTitleDisplayMode(.inline)
                    .overlay(alignment: .top) {
                        if let toastText = dm.toastText {
                            ToastView(toastText: toastText)
                                .offset(y: 20)
                        }
                    }
                    .toolbar {
                        ToolbarItem(placement: .navigationBarLeading) {
                            HStack {
                                if !dm.inPlay {
                                    Button {
                                        dm.newGame()
                                    } label: {
                                        Text("New")
                                            .foregroundStyle(.primary)
                                    }
                                }

                                Button {
                                    
                                } label: {
                                    Image(systemName: "questionmark.circle")
                                }
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
                                    withAnimation {
                                        dm.showStats.toggle()
                                    }
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
            if dm.showStats {
                StatsView()
            }
        }
    }
}

#Preview {
    GameView()
        .environmentObject(WordleDataModel())
}

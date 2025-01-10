//
//  WordleDataModel.swift
//  WordleClone
//
//  Created by Gorkem on 9.01.2025.
//

import SwiftUI

class WordleDataModel: ObservableObject {
    @Published var guesses: [Guess] = []
    @Published var incorrectAttemps = [Int](repeating: 0, count: 6)
    
    var keyColors = [String: Color]()
    var selectedWord = ""
    var currentWord = ""
    var tryIndex = 0
    var inPlay = false
    var isGameOver = false
    
    var gameStarted: Bool {
        !currentWord.isEmpty || tryIndex > 0
    }
    
    var disabledKeys: Bool {
        !inPlay || currentWord.count == 5
    }
    
    init() {
        newGame()
    }
    
    // MARK: - Setup
    func newGame() {
        populateDefaults()
        selectedWord = Global.commonWords.randomElement()!
        currentWord = ""
        inPlay = true
    }
    
    
    private func populateDefaults() {
        guesses = []
        for index in 0...5 {
            guesses.append(Guess(index: index))
        }
        // reset keyboard colors
        let letters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
        for char in letters {
            keyColors[String(char)] = .unused
        }
    }
    
    // MARK: - Game Play
    func addToCurrentWord(_ letter: String) {
        currentWord += letter
        updateRow()
    }
    
    func enterWord() {
        if currentWord == selectedWord {
            isGameOver = true
            print("You Win")
            setCurrentGuessColors()
            inPlay = false
        } else {
            if verifyWord() {
                print("Valid word")
                setCurrentGuessColors()
                tryIndex += 1
                if tryIndex == 6 {
                    isGameOver = true
                    inPlay = false
                    print("You lose")
                }
            } else {
                withAnimation {
                    self.incorrectAttemps[tryIndex] += 1
                }
                incorrectAttemps[tryIndex] = 0
            }
        }
    }
    
    func removeLetterFromCurrentWord() {
        currentWord.removeLast()
        updateRow()
    }
    
    func updateRow() {
        let guessWord = currentWord.padding(toLength: 5, withPad: " ", startingAt: 0)
        guesses[tryIndex].word = guessWord
    }
    
    func verifyWord() -> Bool {
        UIReferenceLibraryViewController.dictionaryHasDefinition(forTerm: currentWord)
    }
    
    func setCurrentGuessColors() {
        let correctLetters = selectedWord.map { String($0)}
        var frequency = [String : Int]()
        
        for letter in correctLetters {
            frequency[letter, default: 0] += 1
        }
        
        for index in 0...4 {
            let correctLetter = correctLetters[index]
            let guessLetter = guesses[tryIndex].guessLetters[index]
            if guessLetter == correctLetter {
                guesses[tryIndex].bgColors[index] = .correct
                frequency[guessLetter]! -= 1
            }
        }
        
        for index in 0...4 {
            let guessLetter = guesses[tryIndex].guessLetters[index]
            if correctLetters.contains(guessLetter)
                && guesses[tryIndex].bgColors[index] != .correct && frequency[guessLetter]! > 0 {
                guesses[tryIndex].bgColors[index] = .misplaced
                frequency[guessLetter]! -= 1
            }
        }
        
        print(selectedWord)
        print(guesses[tryIndex].word)
    }
}

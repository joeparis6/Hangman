//
//  HangmanVM.swift
//  Hangman
//
//  Created by Joe Paris on 6/27/22.
//

import SwiftUI

class HangmanVM: ObservableObject {
    
    static func createHangmanGame() -> HangmanGame {
        HangmanGame(guesses: 5, word: "SKUNK")
    }
    
    func guessIntent(Letter: Character) -> String {
        let result = hangman.turn(guess: Letter)
        switch result {
        case .correct:
            return "Correct!"
        case .incorrect:
            return "Incorrect!"
        case .won:
            return "You won!"
        case .lost:
            return "You lost!"
        }
    }
    
    @Published private var hangman: HangmanGame = createHangmanGame()
    
    
}

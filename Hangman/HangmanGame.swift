//
//  HangmanGame.swift
//  Hangman
//
//  Created by Joe Paris on 6/14/22.
//

import Foundation

struct HangmanGame {
    var incorrectGuessCount: Int
    var numGuesses: Int
    var hangmanWord: String
    var wonGame: Bool
    var guessedLetters: Set<Character>
    
    enum Results {
        case correct
        case incorrect
        case won
        case lost
    }
    
    mutating func guessLetter(guess: Character) -> Bool {
        
        //print(hangmanWord)
        if guessedLetters.contains(guess) {
            return false
        }
        else {
            guessedLetters.insert(guess)
        }
        print(guessedLetters)
        if !hangmanWord.contains(guess) {
            print(hangmanWord, " does not contain ", guess)
            incorrectGuessCount += 1
            return false
        }
        else {
            print(hangmanWord, " does contain ", guess)
            return true
        }
    }
    
    func gameOver() -> Bool {
        
        //let answerLength = hangmanWord.count
        for letterIndex in hangmanWord.indices {
            let letter = hangmanWord[letterIndex]
            if !guessedLetters.contains(letter) {
                if incorrectGuessCount < numGuesses {
                    return false
                }
            }
        }
        
        print("Game over")
        return true
    }
    
    mutating func turn(guess: Character) -> Results {
        let correctguess = guessLetter(guess: guess)
        let gameOver = gameOver()
        if correctguess, gameOver {
            //print("you win!")
            return Results.won
        } else if !correctguess, gameOver {
            //print("you lose!")
            return Results.lost
        } else if correctguess, !gameOver {
            //print("correct!")
            return Results.correct
        } else  {
            //print("incorrect!")
            return Results.incorrect
        }
    }
    
    init(guesses: Int, word: String) {
        incorrectGuessCount = 1
        numGuesses = guesses
        hangmanWord = word
        wonGame = false
        guessedLetters = []
    }
}

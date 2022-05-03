//
//  GameManager.swift
//  WordleGame
//
//  Created by Alex on 3.05.22.
//

import Foundation

struct GameManager {
    let randomWord: String
    let countOfLetters: Int
    let countOfAttempts: Int
    var arrayOfWordLetters: [LetterBox?] = []
    var letterBoxArray: [[LetterBox?]] = []
    
    init(randomWord: String) {
        self.randomWord = randomWord
        countOfLetters = randomWord.count
        countOfAttempts = randomWord.count
        
        for letter in randomWord {
            arrayOfWordLetters.append(LetterBox(letter: String(letter), status: nil))
        }
        for numberOfLine in 0...countOfAttempts - 1 {
            letterBoxArray.append(arrayOfWordLetters)
        }
    }
}

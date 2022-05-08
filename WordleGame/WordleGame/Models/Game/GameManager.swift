//
//  GameManager.swift
//  WordleGame
//
//  Created by Alex on 3.05.22.
//

import Foundation

struct GameManager {
    
    private var currentLetterIndexInRow = 0
    private var currentAttemptIndex = 0
    
    var randomWord: String = ""
    
    var countOfLetters: Int = 0
    var countOfAttempts: Int = 0
    
    var gameField: [[LetterBox?]]
    
    init() {
        self.randomWord = "World"
        self.countOfLetters = randomWord.count
        self.countOfAttempts = randomWord.count
        let row: [LetterBox?] = Array(repeating: nil, count: countOfLetters)
        
        self.gameField = Array(repeating: row,
                               count: countOfAttempts)
        
    }
    
//    func getRandomWordFromTXTFile() -> String {
//        guard let path = Bundle.main.path(forResource: "AllowedWords", ofType: "txt"),
//              let allowedWordsArray = try? String(contentsOfFile: path, encoding: String.Encoding.utf8).split(separator: "\n") else { return ""}
//        let allowedWords = Set(allowedWordsArray)
//        let randomWord = allowedWords.randomElement()
//
//        return String(randomWord ?? "")
//    }
    
    mutating func handleKeyboardSymbolEnter(_ symbol: KeyboardSymbol) {
        switch symbol {
        case .enter:
            print("")
        case .delete:
            print("")
        case .character(let letter):
            addLetter(letter)
        }
    }
    
    private mutating func addLetter(_ letter: String) {
        if currentLetterIndexInRow >= countOfLetters {
            return
        }
        
        gameField[currentAttemptIndex][currentLetterIndexInRow] =
            LetterBox(letter: letter, status: nil)
        
        currentLetterIndexInRow += 1
    }
}

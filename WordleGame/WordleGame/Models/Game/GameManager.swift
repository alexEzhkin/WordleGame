//
//  GameManager.swift
//  WordleGame
//
//  Created by Alex on 3.05.22.
//

import Foundation
import UIKit

struct GameManager {
    
    private var currentLetterIndexInRow = 0
    private var currentAttemptIndex = 0
    
    private var resultWord: String!
    
    var delegate: AlertDelegate?
    var resultDelegate: GameResultDelegate?
    
    var countOfLetters: Int = 0
    var countOfAttempts: Int = 0
    
    var scorePoints: Int = 0
    
    var gameField: [[LetterBox?]]!
    
    init() {
        self.resultWord = getRandomWordFromTXTFile()
        self.countOfLetters = resultWord.count
        self.countOfAttempts = resultWord.count
        let row: [LetterBox?] = Array(repeating: nil, count: countOfLetters)
        
        self.gameField = Array(repeating: row,
                               count: countOfAttempts)
    }
    
    func getRandomWordFromTXTFile() -> String {
        guard let path = Bundle.main.path(forResource: "AllowedWords", ofType: "txt"),
              let allowedWordsArray = try? String(contentsOfFile: path, encoding: String.Encoding.utf8).split(separator: "\n") else { return ""}
        let allowedWords = Set(allowedWordsArray)
        let randomWord = allowedWords.randomElement()

        return String(randomWord ?? "")
    }
    
    mutating func handleKeyboardSymbolEnter(_ symbol: KeyboardSymbol) {
        switch symbol {
        case .enter:
            checkWord()
        case .delete:
            deleteLastLetter()
        case .character(let letter):
            addLetter(letter)
        }
    }
    
    // MARK: Check Word
    
    private mutating func checkWord() {
        if currentLetterIndexInRow < countOfLetters ||
            currentAttemptIndex >= countOfAttempts {
            return
        }
        
        guard let currentWord = getCurrentWord() else {
            return
        }
        
        let resultWordArray = Array(resultWord)
        
        for (index, letter) in currentWord.enumerated() {
            if letter == resultWordArray[index] {
                gameField[currentAttemptIndex][index]?.status = .rightLetterOnRightPlace
                scorePoints += 2
                
                continue
            }
            
            // TODO: Update the condition to take letters number in count
            if resultWord.contains(letter) {
                gameField[currentAttemptIndex][index]?.status = .rightLetterOutOfPlace
                scorePoints += 1
                
                continue
            }
            
            gameField[currentAttemptIndex][index]?.status = .wrongLetter
        }
        
        if currentWord == resultWord {
            handleWin()
            
            return
        }
        
        currentAttemptIndex += 1
        currentLetterIndexInRow = 0
        
        if currentAttemptIndex == countOfAttempts {
            handleLose()
        }
    }
    
    private func getCurrentWord() -> String? {
        let wordRow = gameField[currentAttemptIndex]
        
        var word = ""
        
        for letterBox in wordRow {
            guard let letter = letterBox?.letter else {
                return nil
            }
            
            word += letter
        }
        
        return word
    }
    
    // MARK: Delete symbol
    
    private mutating func deleteLastLetter() {
        let previousLetterIndex = currentLetterIndexInRow - 1
        
        if previousLetterIndex < 0 {
            return
        }
        
        gameField[currentAttemptIndex][previousLetterIndex] = nil
        
        currentLetterIndexInRow = previousLetterIndex
    }
    
    // MARK: Add letter
    
    private mutating func addLetter(_ letter: String) {
        if currentLetterIndexInRow >= countOfLetters {
            return
        }
        
        gameField[currentAttemptIndex][currentLetterIndexInRow] =
            LetterBox(letter: letter, status: nil)
        
        currentLetterIndexInRow += 1
    }
    
    // MARK: Handle game end
    
    private func handleWin() {
        self.resultDelegate?.saveGameScore(score: scorePoints)
        self.delegate?.showAlert(alertText: "You Win", alertMessage: "Congratulations! To achieve victory, you needed \(currentAttemptIndex + 1) attempts" )
    }
    
    private func handleLose() {
        self.resultDelegate?.saveGameScore(score: scorePoints)
        self.delegate?.showAlert(alertText: "You Lose", alertMessage: "Sorry. You have used all attempts. Try again or go to the main menu")
    }
}

//
//  GameViewController.swift
//  WordleGame
//
//  Created by Alex on 23.04.22.
//

import UIKit

class GameViewController: UIViewController {

    @IBOutlet weak var keyboardContainer: KeyboardView!
    @IBOutlet weak var letterContainer: LetterView!
    
    private let keyboardManager = KeyboardManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        keyboardContainer.updateKeyboardSymbols(keyboardManager.keyboardSymbols)
        letterContainer.updateLetterBoxSymbols(GameManager.init(randomWord: getRandomWordFromTXTFile()).letterBoxArray)
    }
    
    func getRandomWordFromTXTFile() -> String {
        guard let path = Bundle.main.path(forResource: "AllowedWords", ofType: "txt"),
              let allowedWordsArray = try? String(contentsOfFile: path, encoding: String.Encoding.utf8).split(separator: "\n") else { return ""}
        let allowedWords = Set(allowedWordsArray)
        let randomWord = allowedWords.randomElement()
        
        return String(randomWord ?? "")
    }
}


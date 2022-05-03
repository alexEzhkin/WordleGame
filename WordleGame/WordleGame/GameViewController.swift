//
//  GameViewController.swift
//  WordleGame
//
//  Created by Alex on 23.04.22.
//

import UIKit

class GameViewController: UIViewController {

    @IBOutlet weak var keyboardContainer: KeyboardView!
    
    private let keyboardManager = KeyboardManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getRandomWordFromTXTFile()
        keyboardContainer.updateKeyboardSymbols(keyboardManager.keyboardSymbols)
    }
    
    func getRandomWordFromTXTFile() {
        guard let path = Bundle.main.path(forResource: "AllowedWords", ofType: "txt"),
                      let allowedWordsArray = try? String(contentsOfFile: path, encoding: String.Encoding.utf8).split(separator: "\n") else { return }
                
                let allowedWords = Set(allowedWordsArray)
                
                let randomWord = allowedWords.randomElement()
        GameManager.init(randomWord: String(randomWord ?? ""))
    }
}


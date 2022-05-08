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
    
    private var gameManager = GameManager()
    private let keyboardManager = KeyboardManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        letterContainer.updateLetterBoxSymbols(gameManager.gameField)
        
        keyboardContainer.delegate = self
        keyboardContainer.updateKeyboardSymbols(keyboardManager.keyboardSymbols)
        
    }
}

extension GameViewController: KeyboardButtonDelegate {
    func handleButtonTap(_ symbol: KeyboardSymbol) {
        gameManager.handleKeyboardSymbolEnter(symbol)
        
        letterContainer.updateLetterBoxSymbols(gameManager.gameField)
    }
    
    private func handleKeyboardSymbolEnter(_ symbol: KeyboardSymbol,
                                           callback: @escaping () -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.gameManager.handleKeyboardSymbolEnter(symbol)
            
            callback()
        }
    }
}


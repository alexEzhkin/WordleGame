//
//  GameViewController.swift
//  WordleGame
//
//  Created by Alex on 23.04.22.
//

import UIKit

class GameViewController: UIViewController {

    @IBOutlet weak var keyboardContainer: KeyboardView!
    @IBOutlet weak var letterContainer: GameFieldView!
    
    private var gameManager = GameManager() {
        didSet {
            gameManager.delegate = self
        }
    }
    private let keyboardManager = KeyboardManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let settingsBarButtonItem = UIBarButtonItem(
            title: NSString(string: "\u{2699}\u{0000FE0E}") as String,
            style: .done,
            target: self,
            action: #selector(openSettings))
        let font = UIFont.systemFont(ofSize: 28)
        let attributes = [NSAttributedString.Key.font : font]
        settingsBarButtonItem.setTitleTextAttributes(attributes, for: .normal)
        self.navigationItem.rightBarButtonItem  = settingsBarButtonItem
        
        letterContainer.updateLetterBoxSymbols(gameManager.gameField)
        
        gameManager.delegate = self
        
        keyboardContainer.delegate = self
        keyboardContainer.updateKeyboardSymbols(keyboardManager.keyboardSymbols)
    }
    
    @objc func openSettings(){
        guard let settingsViewController = UIStoryboard(name: "Main", bundle: nil)
                .instantiateViewController(withIdentifier: "settingsVC") as? SettingsViewController else { return }
        
        navigationController?.pushViewController(settingsViewController, animated: true)
    }
    
    func restartGame(userName: String) {
        gameManager.saveData(userName: userName)
        
        gameManager = GameManager()
        letterContainer.updateLetterBoxSymbols(gameManager.gameField)
    }
}

extension GameViewController: KeyboardButtonDelegate {
    func handleButtonTap(_ symbol: KeyboardSymbol) {
        gameManager.handleKeyboardSymbolEnter(symbol)

        letterContainer.updateLetterBoxSymbols(gameManager.gameField)
    }
}

extension GameViewController: AlertDelegate {

    func showAlert(alertText: String, alertMessage: String) {
    let messageAlert = UIAlertController(title: alertText,
                                         message: alertMessage,
                                         preferredStyle: .alert)
        
        messageAlert.addTextField()
    
        let restartAction = UIAlertAction(title: "Restart",
                                       style: .default) { _ in
            let userName = messageAlert.textFields?.first?.text ?? "username"
            
            self.restartGame(userName: userName)
        }
        let openMenuAction = UIAlertAction(title: "Menu",
                                           style: .default) { _ in
            self.navigationController?.popToRootViewController(animated: true)
        }
        
        messageAlert.addAction(restartAction)
        messageAlert.addAction(openMenuAction)
    
    present(messageAlert, animated: true)
    }
}



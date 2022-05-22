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
    
    var gameTime = 0
    var timer: Timer?
    
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
        gameManager.resultDelegate = self
        
        keyboardContainer.delegate = self
        keyboardContainer.updateKeyboardSymbols(keyboardManager.keyboardSymbols)
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(countdown), userInfo: nil, repeats: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        if self.isMovingFromParent {
            timer?.invalidate()
        }
    }
    
    @objc func countdown() {
        gameTime += 1
    }
    
    @objc func openSettings(){
        guard let settingsViewController = UIStoryboard(name: "Main", bundle: nil)
                .instantiateViewController(withIdentifier: "settingsVC") as? SettingsViewController else { return }
        
        navigationController?.pushViewController(settingsViewController, animated: true)
    }
    
    func restartGame() {
        gameManager = GameManager()
        letterContainer.updateLetterBoxSymbols(gameManager.gameField)
    }
    
    func saveGameResult(score: Int, time: Int) {
        let gameResult = GameResult(score: score, time: time)
        
        guard let encodedObject = try? JSONEncoder().encode(gameResult) else {
            return
        }
        
        UserDefaults.standard.set(encodedObject, forKey: "gameResult")
        
        guard let objectData = UserDefaults.standard.data(forKey: "gameResult") else {
            return
        }
        
        guard let decodedObject = try? JSONDecoder().decode(GameResult.self, from: objectData) else {
            return
        }
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
    
        let restartAction = UIAlertAction(title: "Restart",
                                       style: .default) { _ in
            self.restartGame()
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

extension GameViewController: GameResultDelegate {
    func saveGameScore(score: Int) {
        saveGameResult(score: score, time: gameTime)
    }
}

struct GameResult: Codable {
    let score: Int
    let time: Int
}



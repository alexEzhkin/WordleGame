//
//  ViewController.swift
//  WordleGame
//
//  Created by Alex on 23.04.22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var keyboardContainer: KeyboardView!
    
    private let keyboardManager = KeyboardManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        keyboardContainer.updateKeyboardSymbols(keyboardManager.keyboardSymbols)
    }


}


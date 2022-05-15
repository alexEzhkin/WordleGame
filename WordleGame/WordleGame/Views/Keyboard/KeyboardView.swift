//
//  KeyboardView.swift
//  WordleGame
//
//  Created by Alex on 27.04.22.
//

import Foundation
import UIKit

class KeyboardView: UIStackView {
    
    var keyboardSymbols: [[KeyboardBox]]
    
    var delegate: KeyboardButtonDelegate?
    
    init(keyboardSymbols: [[KeyboardBox]]) {
        self.keyboardSymbols = keyboardSymbols
        
        super.init(frame: .zero)
        
        self.setUpView()
    }
    
    required init(coder: NSCoder) {
        self.keyboardSymbols = []
        
        super.init(coder: coder)
        
        self.setUpView()
    }
    
    private func setUpView() {
        self.axis = .vertical
        self.alignment = .center
        self.distribution = .fillEqually
        self.spacing = 4
        
        createKeyboard()
    }
    
    private func createKeyboard() {
        for row in keyboardSymbols {
            let stackView = UIStackView()
            stackView.axis = .horizontal
            stackView.alignment = .fill
            stackView.distribution = .fill
            stackView.spacing = 4
            
            self.addArrangedSubview(stackView)
            
            for box in row {
                let keyboardBoxView = KeyboardBoxView(keyboardBox: box)
                keyboardBoxView.delegate = delegate
                
                stackView.addArrangedSubview(keyboardBoxView)
            }
        }
    }
    
    func updateKeyboardSymbols(_ keyboardSymbols: [[KeyboardBox]]) {
        self.keyboardSymbols = keyboardSymbols
        
        self.createKeyboard()
    }
}

//
//  LetterBoxView.swift
//  WordleGame
//
//  Created by Alex on 24.04.22.
//

import Foundation
import UIKit

class LetterBoxView: UILabel {
    
    private var letterBox: LetterBox?
    
    init(letterBox: LetterBox?) {
        self.letterBox = letterBox
        
        super.init(frame: .zero)
        
        setUpView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUpView()
    }
    
    private func setUpView() {
        updateView(leterBox: letterBox)
        
        setFont()
        setCornerRadius()
        addConstrains()
    }
    
    private func setFont() {
        self.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        self.textAlignment = .center
    }
    
    private func setCornerRadius() {
        self.layer.cornerRadius = 5
        self.layer.borderWidth = 2
        self.layer.borderColor = UIColor.black.cgColor
    }
    
    private func addConstrains() {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.widthAnchor.constraint(equalTo: self.heightAnchor)
        ])
    }
    
    func updateView(leterBox: LetterBox?) {
        updateLabel(letter: letterBox?.letter)
        updateBackground(status: leterBox?.status)
    }
    
    private func updateLabel(letter: String?) {
        self.text = letter?.uppercased()
        self.textColor = .black
    }
    
    private func updateBackground(status: LetterEvaluation?) {
        self.backgroundColor = status?.backgroundColor ?? .white
    }
}

extension LetterEvaluation {
    var backgroundColor: UIColor {
        switch self {
        case .wrongLetter:
            return .gray
            
        case .rightLetterOutOfPlace:
            return .yellow
            
        case .rightLetterOnRightPlace:
            return .green
        }
    }
}

extension Optional where Wrapped == LetterEvaluation {
    var backgroundColor: UIColor {
        self?.backgroundColor ?? .clear
    }
}

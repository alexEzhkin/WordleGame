//
//  LetterBoxView.swift
//  WordleGame
//
//  Created by Alex on 24.04.22.
//

import Foundation
import UIKit

class LetterBoxView: UIView {
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var letterLabel: UILabel!
    
    private var letterBox: LetterBox?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUpView()
    }
    
    private func setUpView() {
        createXib()
    }
    
    private func createXib() {
        Bundle.main.loadNibNamed("LetterBoxView", owner: self, options: nil)
        
        addSubview(contentView)
        
        contentView.frame = bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    
    func updateView(leterBox: LetterBox?) {
        updateLabel(letter: letterBox?.letter)
        updateBackground(status: leterBox?.status)
    }
    
    private func updateLabel(letter: String?) {
        letterLabel.text = letter?.uppercased()
    }
    
    private func updateBackground(status: LetterEvaluation?) {
        contentView.backgroundColor = status?.backgroundColor ?? .clear
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

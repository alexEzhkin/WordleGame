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
        switch letterBox?.status {
        case .wrongLetter:
            contentView.backgroundColor = .gray
        case .rightLetterOutOfPlace:
            contentView.backgroundColor = .yellow
        case .rightLetterOnRightPlace:
            contentView.backgroundColor = .green
            
        default:
            contentView.backgroundColor = .clear
        }
    }
}

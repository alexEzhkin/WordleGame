//
//  LetterView.swift
//  WordleGame
//
//  Created by Alex on 3.05.22.
//

import Foundation
import UIKit

class LetterView: UIStackView {
    
    var letterBoxArray: [[LetterBox?]]
    
    init(letterBoxArray: [[LetterBox?]]) {
        self.letterBoxArray = letterBoxArray
        
        super.init(frame: .zero)
        
        self.setUpView()
    }
    
    required init(coder: NSCoder) {
        self.letterBoxArray = []
        
        super.init(coder: coder)
        
        self.setUpView()
    }
    
    private func setUpView() {
        self.axis = .vertical
        self.alignment = .center
        self.distribution = .fillEqually
        self.spacing = 4
        
        createLetterBox()
    }
    
    private func createLetterBox() {
        for row in letterBoxArray {
            let stackView = UIStackView()
            stackView.axis = .horizontal
            stackView.alignment = .fill
            stackView.distribution = .fillEqually
            stackView.spacing = 4

            self.addArrangedSubview(stackView)

            for box in row {
                let letterBoxView = LetterBoxView(letterBox: box)

                stackView.addArrangedSubview(letterBoxView)
            }
        }
    }
    
    func updateLetterBoxSymbols(_ letterBoxArray: [[LetterBox?]]) {
        self.letterBoxArray = letterBoxArray
        
                for subview in subviews {
                    subview.removeFromSuperview()
                }
        
        self.createLetterBox()
    }
}

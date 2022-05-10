//
//  LetterBox.swift
//  WordleGame
//
//  Created by Alex on 24.04.22.
//

import Foundation
import UIKit

struct LetterBox {
    let letter: String
    var status: LetterEvaluation?
    
    init(letter: String,
         status: LetterEvaluation? = nil) {
        self.letter = letter
        self.status = status
    }
}

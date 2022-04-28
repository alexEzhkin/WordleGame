//
//  KeyboardBox.swift
//  WordleGame
//
//  Created by Alex on 27.04.22.
//

import Foundation

struct KeyboardBox {
    let symbol: KeyboardSymbol
    let status: LetterEvaluation?
    
    init(symbol: KeyboardSymbol,
         status: LetterEvaluation? = nil) {
        self.symbol = symbol
        self.status = status
    }
}

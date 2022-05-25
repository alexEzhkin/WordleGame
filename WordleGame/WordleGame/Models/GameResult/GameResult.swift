//
//  GameResult.swift
//  WordleGame
//
//  Created by Alex on 26.05.22.
//

import Foundation

struct GameResult: Codable {
    let userName: String
    
    let score: Int
    let time: Int
}

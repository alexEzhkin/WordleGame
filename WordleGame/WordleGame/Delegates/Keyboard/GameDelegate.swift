//
//  GameDelegate.swift
//  WordleGame
//
//  Created by Alex on 18.05.22.
//

import Foundation

protocol GameDelegate {
    func handleWin(numberOfAttempts: Int)
    func handleLose()
}

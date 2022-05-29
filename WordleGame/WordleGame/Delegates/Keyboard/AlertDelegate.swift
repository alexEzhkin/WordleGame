//
//  AlertDelegate.swift
//  WordleGame
//
//  Created by Alex on 18.05.22.
//

import Foundation

protocol AlertDelegate {
    func handleWin(numberOfAttempts: Int)
    func handleLose()
    func showAlert(alertText : String, alertMessage : String)
}

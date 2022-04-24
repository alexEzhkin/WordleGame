//
//  LetterBox.swift
//  WordleGame
//
//  Created by Alex on 24.04.22.
//

import Foundation
import UIKit

enum Evaluation {
    case wrongLetter
    case rightLetterOutOfPlace
    case rightLetterOnRightPlace
    
    var value: UIColor {
        switch self {
        case .wrongLetter:
            return Evaluation.grayColor
        case .rightLetterOutOfPlace:
            return Evaluation.yellowColor
        case .rightLetterOnRightPlace:
            return Evaluation.greenColor
        }
    }
    private static let grayColor = UIColor.gray
    private static let yellowColor = UIColor.yellow
    private static let greenColor = UIColor.green
}



struct LetterBox {
    let letter: Character
    let status: Evaluation?
}

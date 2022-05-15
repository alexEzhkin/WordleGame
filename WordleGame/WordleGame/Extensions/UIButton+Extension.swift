//
//  UIButton+Extension.swift
//  WordleGame
//
//  Created by Alex on 30.04.22.
//

import UIKit

extension UIButton {
    override open func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        self.transform = CGAffineTransform(scaleX: 0.7, y: 0.7)
        
        UIView.animate(withDuration: 0.5,
                       delay: 0,
                       usingSpringWithDamping: 0.5,
                       initialSpringVelocity: 6,
                       options: .allowUserInteraction,
                       animations: { self.transform = CGAffineTransform.identity },
                       completion: nil)
        super.touchesBegan(touches, with: event)
    }
}

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
}

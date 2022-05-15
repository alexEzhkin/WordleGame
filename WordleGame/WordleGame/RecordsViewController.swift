//
//  RecordsViewController.swift
//  WordleGame
//
//  Created by Alex on 16.05.22.
//

import UIKit

class RecordsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let settingsBarButtonItem = UIBarButtonItem(
            title: NSString(string: "\u{2699}\u{0000FE0E}") as String,
            style: .done,
            target: self,
            action: #selector(openSettings))
        let font = UIFont.systemFont(ofSize: 28)
        let attributes = [NSAttributedString.Key.font : font]
        settingsBarButtonItem.setTitleTextAttributes(attributes, for: .normal)
        self.navigationItem.rightBarButtonItem  = settingsBarButtonItem
    }
    
    @objc func openSettings(){
        guard let settingsViewController = UIStoryboard(name: "Main", bundle: nil)
                .instantiateViewController(withIdentifier: "settingsVC") as? SettingsViewController else { return }
        
        navigationController?.pushViewController(settingsViewController, animated: true)
    }
}

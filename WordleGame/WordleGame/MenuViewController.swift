//
//  MenuViewController.swift
//  WordleGame
//
//  Created by Alex on 15.05.22.
//

import UIKit

class MenuViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func handlePlayButton(_ sender: Any) {
        guard let gameViewController = UIStoryboard(name: "Main", bundle: nil)
                .instantiateViewController(withIdentifier: "gameVC") as? GameViewController else { return }
        
        navigationController?.pushViewController(gameViewController, animated: true)
    }
    
    @IBAction func handleRecordsButton(_ sender: Any) {
        guard let recordsViewController = UIStoryboard(name: "Main", bundle: nil)
                .instantiateViewController(withIdentifier: "recordsVC") as? RecordsViewController else { return }
        
        navigationController?.pushViewController(recordsViewController, animated: true)
    }
    
    @IBAction func handleSettingsButton(_ sender: Any) {
        guard let settingsViewController = UIStoryboard(name: "Main", bundle: nil)
                .instantiateViewController(withIdentifier: "settingsVC") as? SettingsViewController else { return }
        
        navigationController?.pushViewController(settingsViewController, animated: true)
    }
    

}

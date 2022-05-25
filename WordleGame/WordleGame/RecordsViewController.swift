//
//  RecordsViewController.swift
//  WordleGame
//
//  Created by Alex on 16.05.22.
//

import UIKit

class RecordsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let gameResults = UserDefaultsService.shared.getGameResults()
    var gameResultsToTableView = [String]()
    
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
        
        gameResultsToTableView = gameResults.compactMap({$0.userName + " / Score: " + String($0.score) + " / Time: " + String($0.time)})
        
        tableView.dataSource = self
        tableView.register(UITableViewCell.self,
                               forCellReuseIdentifier: "TableViewCell")
    }
    
    @objc func openSettings(){
        guard let settingsViewController = UIStoryboard(name: "Main", bundle: nil)
                .instantiateViewController(withIdentifier: "settingsVC") as? SettingsViewController else { return }
        
        navigationController?.pushViewController(settingsViewController, animated: true)
    }
}

extension RecordsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.gameResultsToTableView.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell",
                                                     for: indexPath)
            cell.textLabel?.text = self.gameResultsToTableView[indexPath.row]
            return cell
    }
}

//
//  DeckViewController.swift
//  Sprep_2
//
//  Created by Bumgeun Song on 2021/12/01.
//

import UIKit

class DeckViewController: UITableViewController {
    
    var deckManager = DeckManager()
 
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return deckManager.getDecks()?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DeckItemCell", for: indexPath)
        if let decks = deckManager.getDecks() {
            let deck = decks[indexPath.row]
            var config = cell.defaultContentConfiguration()
            config.text = deck.name
            cell.contentConfiguration = config
        }
        return cell
    }
    
    // MARK: - Table view Delegate

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // start test
        if let decks = deckManager.getDecks() {
            performSegue(withIdentifier: "goToTest", sender: decks[indexPath.row])
        }
    }

    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let selectedRow = self.deckManager.getDecks()![indexPath.row]
        let rename = UIContextualAction(style: .normal, title: "Rename") { action, view, completetionhandler in
            self.renamePressed(row: selectedRow)
            completetionhandler(true)
        }
        rename.backgroundColor = UIColor(named: "Champagne Pink")
        
        let open = UIContextualAction(style: .normal, title: "Open") { action, view, completetionhandler in
            self.openPressed(row: selectedRow)
            completetionhandler(true)
        }
        open.backgroundColor = UIColor(named: "Skobe")
        
        let delete = UIContextualAction(style: .normal, title: "Delete") { action, view, completetionhandler in
            self.deletePressed(row: selectedRow)
            completetionhandler(true)
        }
        delete.backgroundColor = UIColor(named: "GoldenGate")
        
        let config = UISwipeActionsConfiguration(actions: [delete, rename, open])
        config.performsFirstActionWithFullSwipe = false
        return config

    }
    
    func renamePressed(row: Deck) {
        let alert = UIAlertController(title: "바꿀 덱 이름을 입력해주세요.", message: "", preferredStyle: .alert)
        
        var textField = UITextField()
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = row.name
            textField = alertTextField
        }
        
        let action = UIAlertAction(title: "바꾸기", style: .default) { action in
            self.deckManager.updateDeck(name: row.name, newName: textField.text!)
            self.tableView.reloadData()
        }
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    func deletePressed(row: Deck) {
        let alert = UIAlertController(title: "정말로 삭제하시겠습니까?", message: "", preferredStyle: .alert)
        
        let delete = UIAlertAction(title: "삭제", style: .default) { action in
            self.deckManager.deleteDeck(name: row.name)
            self.tableView.reloadData()
        }
        
        let cancel = UIAlertAction(title: "취소", style: .default) { action in
        }
        
        alert.addAction(delete)
        alert.addAction(cancel)
        present(alert, animated: true, completion: nil)
    }
    
    func openPressed(row: Deck) {
        performSegue(withIdentifier: "goToCards", sender: row)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToCards" {
            let destinationVC = segue.destination as! CardViewController
            destinationVC.selectedDeck = sender as? Deck
        } else if segue.identifier == "goToTest" {
            let destinationVC = segue.destination as! TestViewController
            destinationVC.tester = Tester(deck: sender as! Deck)
        }
        
    }
    
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "새로운 덱의 이름을 입력해주세요.", message: "", preferredStyle: .alert)
        
        var textField = UITextField()
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "덱 이름"
            textField = alertTextField
        }
        
        let action = UIAlertAction(title: "만들기", style: .default) { action in
            self.deckManager.createDeck(name: textField.text!)
            self.tableView.reloadData()
        }
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    
}

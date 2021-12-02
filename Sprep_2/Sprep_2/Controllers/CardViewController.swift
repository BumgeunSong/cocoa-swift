//
//  CardViewController.swift
//  Sprep_2
//
//  Created by Bumgeun Song on 2021/12/01.
//

import UIKit

class CardViewController: UITableViewController {

    var selectedDeck: Deck?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if let cards = selectedDeck!.cards {
            if cards.count != 0 { return cards.count }
        }
        return 1
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CardItemCell", for: indexPath)
        var config = cell.defaultContentConfiguration()
        if let cards = selectedDeck!.cards {
            if cards.isEmpty {
                config.text = "카드가 없습니다. +를 눌러 카드를 만들어주세요."
            } else {
                config.text = cards[indexPath.row].front
            }
        }
        cell.contentConfiguration = config
        return cell
    }
 
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "goToNewCard", sender: selectedDeck)
    }
    
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let selectedRow = self.selectedDeck!.getCardsAll()![indexPath.row]
        let edit = UIContextualAction(style: .normal, title: "Edit") { action, view, completetionhandler in
            self.editPressed(row: selectedRow)
            completetionhandler(true)
        }
        edit.backgroundColor = UIColor(named: "Champagne Pink")
        
        let delete = UIContextualAction(style: .normal, title: "Delete") { action, view, completetionhandler in
            self.deletePressed(row: selectedRow)
            completetionhandler(true)
        }
        delete.backgroundColor = UIColor(named: "GoldenGate")
        
        let config = UISwipeActionsConfiguration(actions: [delete, edit])
        config.performsFirstActionWithFullSwipe = false
        return config

    }
    
    func editPressed(row: Card) {
        performSegue(withIdentifier: "goToNewCard", sender: row)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! NewCardViewController
        if sender is Deck {
            destinationVC.selectedDeck = sender as? Deck
        } else if sender is Card {
            destinationVC.selectedCard = sender as? Card
        }
//
//
//        if segue.identifier == "goToCards" {
//            let destinationVC = segue.destination as! CardViewController
//            destinationVC.selectedDeck = sender as? Deck
//        } else if segue.identifier == "goToTest" {
//            let destinationVC = segue.destination as! TestViewController
//            destinationVC.tester = Tester(deck: sender as! Deck)
//        }
        
    }
    
    func deletePressed(row: Card) {
        let alert = UIAlertController(title: "정말로 삭제하시겠습니까?", message: "", preferredStyle: .alert)
        
        let delete = UIAlertAction(title: "삭제", style: .default) { action in
            self.selectedDeck?.deleteCard(card: row)
            self.tableView.reloadData()
        }
        
        let cancel = UIAlertAction(title: "취소", style: .default) { action in
        }
        
        alert.addAction(delete)
        alert.addAction(cancel)
        present(alert, animated: true, completion: nil)
        
    }
    
    @IBAction override func unwind(for unwindSegue: UIStoryboardSegue, towards subsequentVC: UIViewController) {
        performSegue(withIdentifier: "unwindToCard", sender: self.selectedDeck)
    }
}

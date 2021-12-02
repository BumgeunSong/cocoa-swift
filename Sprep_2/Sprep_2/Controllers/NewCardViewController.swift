//
//  NewCardViewController.swift
//  Sprep_2
//
//  Created by Bumgeun Song on 2021/12/01.
//

import UIKit

class NewCardViewController: UIViewController, UITextFieldDelegate {
    
    var selectedDeck: Deck?
    var selectedCard: Card?
    
    @IBOutlet weak var frontTextField: UITextField!
    @IBOutlet weak var backTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        frontTextField.delegate = self
        backTextField.delegate = self
        if let selectedCard = selectedCard {
            frontTextField.text = selectedCard.front
            backTextField.text = selectedCard.back
        }
    }
    
    
    
    @IBAction func completePressed(_ sender: UIButton) {
        guard let frontInput = frontTextField.text, let backInput = backTextField.text else {
            return
        }
        
        if frontInput.isEmpty || backInput.isEmpty {
            let alert = UIAlertController(title: "아직 입력하지 않은 칸이 있습니다. 진행하시겠습니까?", message: "", preferredStyle: .alert)
            let delete = UIAlertAction(title: "확인", style: .default) { action in
                if let selectedCard = self.selectedCard {
                    selectedCard.front = frontInput
                    selectedCard.back = backInput
                    self.performSegue(withIdentifier: "goBackToCard", sender: nil)
                } else if let selectedDeck = self.selectedDeck {
                    selectedDeck.createCard(front: frontInput, back: backInput)
                    self.performSegue(withIdentifier: "goBackToCard", sender: self.selectedDeck)
                }
                
            }
            
            let cancel = UIAlertAction(title: "취소", style: .default) { action in
            }
            alert.addAction(delete)
            alert.addAction(cancel)
            present(alert, animated: true, completion: nil)
        } else {
            self.performSegue(withIdentifier: "goBackToCard", sender: self.selectedDeck)
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! CardViewController
        destinationVC.selectedDeck = sender as? Deck
    }
}

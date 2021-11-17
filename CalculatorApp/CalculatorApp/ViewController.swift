//
//  ViewController.swift
//  CalculatorApp
//
//  Created by Bumgeun Song on 2021/11/17.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var displayLabel: UILabel!
    var isTypingNumber: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func numPressed(_ sender: UIButton) {
        guard let input = sender.titleLabel?.text else {
            print("Invalid Input")
            return
        }
        
        if displayLabel.text!.count == 18 {
            print("Maximum length")
            return
        }
        
        if input == "." && displayLabel.text!.contains(".") {
            print("Cannot use Decimal point when number is not Integer")
            return
        }
        
        if isTypingNumber {
            displayLabel.text! += input
        } else {
            displayLabel.text = input
            isTypingNumber = true
        }
        
    }
    
    @IBAction func operatorPressed(_ sender: UIButton) {
    }
    
    // MARK: - Handling Gesture
    
    override func becomeFirstResponder() -> Bool {
        return true
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            displayLabel.text = "0"
            isTypingNumber = false
        }
    }
    
}


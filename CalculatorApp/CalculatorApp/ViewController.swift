//
//  ViewController.swift
//  CalculatorApp
//
//  Created by Bumgeun Song on 2021/11/17.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    @IBOutlet var stacks: [UIButton]!
    @IBOutlet var opStacks: [UIButton]!
    
    var stackPointer = 0
    var calculatorLogic = CalculatorLogic()
    
    var previousOperator: String?
    var previousNumber: Double?
    
    var isTypingNumber: Bool = false
    var currentNumber: Double {
        guard let number = Double(displayLabel.text!) else {
            fatalError("Cannot convert Text to Number.")
        }
        return number
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - If user press blue button
    
    @IBAction func numPressed(_ sender: UIButton) {
        guard let numInput = sender.titleLabel?.text else {
            print("Invalid Input")
            return
        }
        
        if displayLabel.text!.count == 18 {
            print("Maximum length")
            return
        }
        
        if numInput == "." && displayLabel.text!.contains(".") {
            print("Cannot use Decimal point when number is not Integer")
            return
        }
        
        if stackPointer >= 5 {
            print("Stack is Full")
            return
        }
        
        if isTypingNumber {
            displayLabel.text! += numInput
        } else {
            displayLabel.text = numInput
            isTypingNumber = true
        }
        
    }
    
    // MARK: - If user press orange button
    
    @IBAction func operatorPressed(_ sender: UIButton) {
        guard let opInput = sender.titleLabel?.text else {
            print("Invalid Input")
            return
        }
        
        if previousOperator == nil {
            if opInput == "=" {
                print("Cannot use = operator without other operator")
                return
            }
            previousNumber = currentNumber
            previousOperator = opInput
            updateStacks(isDone: false)
            
        } else {
            guard let prev = previousNumber, let prevOp = previousOperator else {
                fatalError("No previsous number & operator")
            }
            
            guard let results = calculatorLogic.calculate(prev, currentNumber, op: prevOp) else {
                fatalError("Cannot caculate with \(prevOp)")
            }
            
            previousNumber = results
            previousOperator = opInput
            updateStacks(isDone: false)
            
            if opInput == "=" {
                updateStacks(isDone: true)
                previousOperator = nil
                stackPointer += 1
            }
        }

        displayLabel.text = "0"
        isTypingNumber = false
    }
    
    // MARK: - Manipulate stacks in View
    
    func updateStacks(isDone: Bool) {
        if isDone {
            for stack in stacks {
                stack.isEnabled = false
            }
            
            for opStack in opStacks {
                opStack.isEnabled = false
                if opStack.tag == stackPointer {
                    opStack.setTitle("", for: .normal)
                }
            }
        } else {
            for stack in stacks {
                if stack.tag == stackPointer {
                    stack.setTitle(String(previousNumber!), for: .normal)
                    stack.isEnabled = true
                } else {
                    stack.isEnabled = false
                }
                
            }
            
            for opStack in opStacks {
                if opStack.tag == stackPointer {
                    opStack.setTitle(previousOperator, for: .normal)
                    opStack.isEnabled = true
                } else {
                    opStack.isEnabled = false
                }
            }
        }
        
    }
    
    func resetStacks() {
        for n in 0..<stacks.count {
            stacks[n].isEnabled = false
            stacks[n].setTitle("Stack\(n+1)", for: .normal)
            stacks[n].titleLabel?.font = UIFont.systemFont(ofSize: 30)
        }
        
        for opStack in opStacks {
            opStack.isEnabled = false
            opStack.setTitle("", for: .normal)
        }
    }
    
    // MARK: - Handling Gesture
    
    override func becomeFirstResponder() -> Bool {
        return true
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            displayLabel.text = "0"
            isTypingNumber = false
            stackPointer = 0
            resetStacks()
        }
    }
    
}


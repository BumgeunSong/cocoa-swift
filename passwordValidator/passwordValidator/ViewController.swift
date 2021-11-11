//
//  ViewController.swift
//  passwordValidator
//
//  Created by Bumgeun Song on 2021/11/10.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var levelView: UIView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var passwordInput: UITextField!
    
    var myValidator = Validator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        descriptionLabel.text = ""
            }

    @IBAction func checkPressed(_ sender: UIButton) {
        if let input = passwordInput.text {
            let level = myValidator.validatePassword(password: input)
            let levelColor = myValidator.getLevelColor(level: level)
            descriptionLabel.text = "Level \(level)"
            descriptionLabel.textColor = levelColor
            levelView.backgroundColor = levelColor
        }
    }
    
}


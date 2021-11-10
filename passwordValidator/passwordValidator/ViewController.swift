//
//  ViewController.swift
//  passwordValidator
//
//  Created by Bumgeun Song on 2021/11/10.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var levelView: UIView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var passwordInput: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        descriptionLabel.text = ""
    }

    @IBAction func checkPressed(_ sender: UIButton) {
    }
    
}


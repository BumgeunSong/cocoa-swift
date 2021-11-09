//
//  ViewController.swift
//  MeasureApp
//
//  Created by Bumgeun Song on 2021/11/09.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var valueTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func convertPressed(_ sender: UIButton) {
        if let valueString = valueTextField.text {
            if let value = Double(valueString) {
                let result = Measurement(value: value, unit: UnitLength.inches)
                    .converted(to: UnitLength.meters)
                    .formatted()
                resultLabel.text = result
            }
        }
    }
}


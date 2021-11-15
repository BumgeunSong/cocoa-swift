//
//  ViewController.swift
//  WaitingManager
//
//  Created by Bumgeun Song on 2021/11/15.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var subtractButton: UIButton!
    @IBOutlet weak var addButton: UIButton!
    
    var numberOfPeopleWaiting: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func buttonPressed(_ sender: UIButton) {
        if let title = sender.titleLabel?.text {
            if title == "대기" {
                numberOfPeopleWaiting += 1
            } else if title == "완료" {
                numberOfPeopleWaiting -= 1
            }
            reloadLabel()
            reloadIsEnable()
            reloadProgress()
        }
    }

    func reloadIsEnable() {
        self.addButton.isEnabled = numberOfPeopleWaiting < 20
        self.subtractButton.isEnabled = numberOfPeopleWaiting > 0
    }
    
    func reloadLabel() {
        numberLabel.text = "\(numberOfPeopleWaiting) 명"
    }
    
    func reloadProgress() {
        progressBar.setProgress(Float(numberOfPeopleWaiting) / 20.0, animated: true)
    }
}


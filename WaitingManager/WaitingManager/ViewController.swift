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
        addButton.addTarget(self, action: #selector(reloadProgress), for: .touchUpInside)
        subtractButton.addTarget(self, action: #selector(reloadProgress), for: .touchUpInside)
    }

    @IBAction func addButtonPressed(_ sender: UIButton) {
        numberOfPeopleWaiting += 1
        reloadLabel()
        reloadIsEnable()
    }
    
    @IBAction func subtractButtonPressed(_ sender: UIButton) {
        numberOfPeopleWaiting -= 1
        reloadLabel()
        reloadIsEnable()
    }
    
    func reloadIsEnable() {
        addButton.isEnabled = numberOfPeopleWaiting < 20
        subtractButton.isEnabled = numberOfPeopleWaiting > 0
    }
    
    func reloadLabel() {
        numberLabel.text = "\(numberOfPeopleWaiting) 명"
    }
    
    @objc func reloadProgress() {
        progressBar.setProgress(Float(numberOfPeopleWaiting) / 20.0, animated: true)
    }
}


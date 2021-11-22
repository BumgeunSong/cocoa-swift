//
//  ViewController.swift
//  HangeulClockApp
//
//  Created by Bumgeun Song on 2021/11/22.
//

import UIKit

class ViewController: UIViewController, CurrentTimeDelegate {

    @IBOutlet weak var isAMLabel1: UILabel!
    @IBOutlet weak var isAMLabel2: UILabel!
    
    var currentTime = CurrentTime()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        currentTime.delegate = self
        
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            print("Time is going on", timer)
            self.currentTime.set()
        }
    }
    
    func didUpdateTime(_ currentTime: CurrentTime) {
        if currentTime.isAM {
            isAMLabel2.textColor = UIColor.gray
        } else {
            isAMLabel1.textColor = UIColor.gray
        }
        
        if currentTime.isDay
    }


}


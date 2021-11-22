//
//  ViewController.swift
//  HangeulClockApp
//
//  Created by Bumgeun Song on 2021/11/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var isAMLabel1: UILabel!
    @IBOutlet weak var isAMLabel2: UILabel!
    
    @IBOutlet weak var moreTenHourLabel: UILabel!
    @IBOutlet weak var isDayLabel: UILabel!
    
    @IBOutlet var hourLabels: [UILabel]!
    
    @IBOutlet weak var unitPlaceSecondLabel: UILabel!
    @IBOutlet weak var moreTenSecondLabel: UILabel!
    @IBOutlet weak var tenPlaceSecondLabel: UILabel!
    
    @IBOutlet var unitPlaceMinuteLabels: [UILabel]!
    @IBOutlet weak var moreTenMinuteLabel: UILabel!
    @IBOutlet var tensPlaceMinuteLabels: [UILabel]!
    
    var currentTime = CurrentTime()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentTime.delegate = self
        
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            self.currentTime.set()
        }
    }
    
    func initializeView() {
        isAMLabel1.textColor = UIColor.darkGray
        isAMLabel2.textColor = UIColor.darkGray
        for hourLabel in hourLabels {
            hourLabel.textColor = UIColor.darkGray
        }
        for tensPlaceMinuteLabel in tensPlaceMinuteLabels {
            tensPlaceMinuteLabel.textColor = UIColor.darkGray
        }
        for unitPlaceMinuteLabel in unitPlaceMinuteLabels {
            unitPlaceMinuteLabel.textColor = UIColor.darkGray
        }
    }
}



extension ViewController: CurrentTimeDelegate {
    
    // Update Time using Delegate Pattern
    
    func didUpdateTime(_ currentTime: CurrentTime) {
        
        initializeView()
        
        // 오전, 오후 표시
        if currentTime.isAM {
            isAMLabel1.textColor = UIColor.white
        } else {
            isAMLabel2.textColor = UIColor.white
        }
        
        // 낮, 밤 표시
        isDayLabel.text = currentTime.isDay ? "☀️" : "🌙"
        
        // 시(hour) 표시
        if currentTime.hour >= 10 {
            moreTenHourLabel.textColor = UIColor.white
        }
        
        for hourLabel in hourLabels {
            if hourLabel.tag == currentTime.hour % 10 {
                hourLabel.textColor = UIColor.white
            }
        }
        
        // 분(minute) 표시
        if currentTime.minute >= 10 {
            moreTenMinuteLabel.textColor = UIColor.white
        }
        
        for tensPlaceMinuteLabel in tensPlaceMinuteLabels {
            if tensPlaceMinuteLabel.tag == currentTime.minute / 10 {
                tensPlaceMinuteLabel.textColor = UIColor.white
            }
        }
        
        for unitPlaceMinuteLabel in unitPlaceMinuteLabels {
            if unitPlaceMinuteLabel.tag == currentTime.minute % 10 {
                unitPlaceMinuteLabel.textColor = UIColor.white
            }
        }
        
        // 초(second) 표시
        if currentTime.second >= 10 {
            moreTenSecondLabel.textColor = UIColor.white
        } else {
            moreTenSecondLabel.textColor = UIColor.black
        }
        
        if currentTime.second / 10 >= 2 {
            tenPlaceSecondLabel.text = Hangeul.numDescription[currentTime.second / 10]
            tenPlaceSecondLabel.textColor = UIColor.white
        } else {
            tenPlaceSecondLabel.textColor = UIColor.black
        }
        
        if currentTime.second % 10 >= 1 {
            unitPlaceSecondLabel.text = Hangeul.numDescription[currentTime.second % 10]
            unitPlaceSecondLabel.textColor = UIColor.white
        } else {
            unitPlaceSecondLabel.textColor = UIColor.black
        }
        
    }
}
    
    


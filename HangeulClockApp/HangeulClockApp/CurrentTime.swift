//
//  TimeManager.swift
//  HangeulClockApp
//
//  Created by Bumgeun Song on 2021/11/22.
//

import Foundation

protocol CurrentTimeDelegate {
    func didUpdateTime(_ currentTime: CurrentTime)
}

struct CurrentTime {
    var isAM: Bool = true
    var hour: Int = 0
    var isDay: Bool = true
    var minute: Int = 0
    var second: Int = 0
    
    var delegate: CurrentTimeDelegate?
    
    mutating func set() {
        let currentDate = Date()
        let calendar = Calendar.current
        let components = calendar.dateComponents([.hour, .minute, .second], from: currentDate)
        
        if let hour = components.hour, let minute = components.minute, let second = components.second {
            
            if hour >= 12 {
                self.hour = hour - 12
                self.isAM = false
            } else {
                self.hour = hour
                self.isAM = true
            }
            
            if hour >= 19 || hour < 7 {
                self.isDay = false
            } else {
                self.isDay = true
            }
            
            self.minute = minute
            self.second = second
        }
        self.delegate?.didUpdateTime(self)
    }
}

//
//  Card.swift
//  Sprep_CLI
//
//  Created by Bumgeun Song on 2021/11/29.
//

import Foundation




class Card {
    internal init(id: UUID, box: Box = .rightNow, front: String, back: String, lastTestTime: Date) {
        self.id = id
        self.box = box
        self.front = front
        self.back = back
        self.lastTestTime = lastTestTime
    }
    
    var id: UUID
    var box: Box
    var front: String
    var back: String
    var lastTestTime: Date
    
    func isDue() -> Bool {
        return lastTestTime + box.rawValue < Date() ? true : false
    }
    
    func refreshTime() {
        self.lastTestTime = Date()
    }
    
    func moveToInitalBox() {
        self.box = .rightNow
    }
    
    func moveToNextBox() {
        switch box {
        case .rightNow:
            self.box = .afterDay
        case .afterDay:
            self.box = .afterWeek
        case .afterWeek:
            self.box = .afterMonth
        case .afterMonth:
            self.box = .archive
        default:
            return
        }
    }
    
    func moveToPrevBox() {
        switch box {
        case .rightNow:
            self.box = .rightNow
        case .afterDay:
            self.box = .rightNow
        case .afterWeek:
            self.box = .afterDay
        case .afterMonth:
            self.box = .afterWeek
        default:
            return
        }
    }
    
    
    
    
}

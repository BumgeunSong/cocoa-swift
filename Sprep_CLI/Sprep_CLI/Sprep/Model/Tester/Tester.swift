//
//  TestManager.swift
//  Sprep_CLI
//
//  Created by Bumgeun Song on 2021/11/29.
//

import Foundation

struct Tester {
    
    var deck: Deck
    var testQueue: [Card]?
    
    var result: [UUID:DifficultyOption] = [:]
    var watch: (start: Date?, end: Date?)
    
    func getDifficultyOption(_ value: String) -> DifficultyOption {
        return DifficultyOption(value: value)
    }
    
    func getTestQueue() -> [Card]? {
        if let testQueue = deck.getDueCards() {
            return testQueue
        } else {
            return nil
        }
    }
    
    mutating func writeDifficulty(card: Card, difficulty: DifficultyOption) {
        result[card.id] = difficulty
    }
    
    func updateDifficulty() {
        deck.arrangeCardIntoBox(result: self.result)
    }
    
    mutating func startWatch() {
        self.watch = (Date(), nil)
    }
    
    mutating func stopWatch() {
        self.watch.end = Date()
    }
    
    func getTimeSpent() -> TimeInterval {
        return watch.end!.timeIntervalSinceReferenceDate - watch.start!.timeIntervalSinceReferenceDate
    }
}

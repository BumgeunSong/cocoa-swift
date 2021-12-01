//
//  Tester.swift
//  Sprep_2
//
//  Created by Bumgeun Song on 2021/12/01.
//

import Foundation

struct Tester {
    
    var deck: Deck
    
    var result: [UUID:DifficultyOption] = [:]
    var watch: (start: Date?, end: Date?)
    
    func getDifficultyOption(_ value: String) -> DifficultyOption {
        return DifficultyOption(value: value)
    }
    
    func getTestQueue() -> [Card]? {
        return deck.getDueCards()
    }
    
    
    mutating func writeDifficulty(card: Card, difficulty: DifficultyOption) {
        result[card.id] = difficulty
    }
    
    func updateTestResult(card: Card, difficulty: DifficultyOption) {
        deck.updateTestResult(card: card, difficulty: difficulty)
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

//
//  Deck.swift
//  Sprep_2
//
//  Created by Bumgeun Song on 2021/12/01.
//

import Foundation


class Deck {
    init(cards: [Card]? = [], name: String) {
        self.cards = cards
        self.name = name
    }
    
    var cards: [Card]?
    var name: String
    
    func getCardsAll() -> [Card]? {
        return cards
    }
    
    func createCard(front: String, back: String) {
        let newCard = Card(id: UUID(), front: front, back: back, lastTestTime: Date())
        self.cards?.append(newCard)
    }
    
    func updateCard(card: Card,  front:String, back: String) {
        if let card = cards?.first(where: { $0 === card }) {
            card.front = front
            card.back = back
        }
    }
    
    func deleteCard(card: Card) {
        if let cardIndex = cards?.firstIndex(where: { $0 === card }) {
            cards?.remove(at: cardIndex)
        }
    }
    
    func getDueCards() -> [Card]? {
        guard let cards = cards else { return nil }
        if cards.filter({$0.isDue()}).isEmpty { return nil }
        return cards.filter { $0.isDue() }
    }
    
    func getNumberOfDueCards() -> Int {
        guard let cards = cards else { return 0 }
        return cards.filter({$0.isDue()}).count
    }
    
    func updateTestResult(card: Card, difficulty: DifficultyOption) {
            switch difficulty {
            case .easy:
                card.refreshTime()
                card.moveToNextBox()
            case .medium:
                card.refreshTime()
                card.moveToPrevBox()
            case .hard:
                card.refreshTime()
                card.moveToInitalBox()
            default:
                break
            }
    }
}

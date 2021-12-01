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
    
    func getCardCommand(_ command: String) -> (option: CardCommand, value: String) {
        return (CardCommand(value: command), command)
    }
    
    func showCards() -> [Card]? {
        if let cards = cards {
            return cards
        } else {
            return nil
        }
    }
    
    func showCard(id: String) -> Card? {
        if let card = cards?.first(where: { $0.id.uuidString == id }) {
            return card
        } else {
            return nil
        }
    }
    
    
    func createCard(front: String, back: String) {
        let newCard = Card(id: UUID(), front: front, back: back, lastTestTime: Date())
        self.cards?.append(newCard)
    }
    
    func updateCard(cardID: String,  front:String, back: String) {
        if let card = cards?.first(where: { $0.id.uuidString == cardID }) {
            card.front = front
            card.back = back
        }
    }
    
    func deleteCard(cardID: String) {
        if let cardIndex = cards?.firstIndex(where: { $0.id.uuidString == cardID }) {
            cards?.remove(at: cardIndex)
        }
    }
    
    func getDueCards() -> [Card]? {
        guard let cards = cards else { return nil }
        if cards.filter({$0.isDue()}).isEmpty { return nil }
        return cards.filter { $0.isDue() }
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

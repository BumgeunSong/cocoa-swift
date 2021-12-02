//
//  DeckManager.swift
//  Sprep_2
//
//  Created by Bumgeun Song on 2021/12/01.
//

import Foundation




struct DeckManager {
    
    var decks: [Deck]? = Dummy().decks
    
    func getDecks() -> [Deck]? {
        if let decks = decks {
            return decks
        } else {
            return nil
        }
    }
    
    mutating func createDeck(name: String) {
        decks?.append(Deck(name: name))
    }
    
    func updateDeck(name: String, newName: String) {
        if let deck = decks?.first(where: { $0.name == name }) {
            deck.name = newName
        }
    }
    
    mutating func deleteDeck(name: String) {
        if let index = decks?.firstIndex(where: { $0.name == name }) {
            decks?.remove(at: index)
        }
    }
    
//    func hasDecks(name: String) -> Bool {
//        return ((decks?.contains(where: { $0.name == name })) != nil)
//    }
}

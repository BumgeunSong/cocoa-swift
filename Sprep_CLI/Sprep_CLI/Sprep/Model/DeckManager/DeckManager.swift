//
//  DeckManager.swift
//  Sprep_CLI
//
//  Created by Bumgeun Song on 2021/11/29.
//

import Foundation


struct DeckManager {
    
    var decks: [Deck]? = Dummy().decks
    
    func getDeckCommand(_ value: String) -> (option: DeckCommand, value: String) {
        return (DeckCommand(value: value), value)
    }
    
    func showDecksAll() -> [Deck]? {
        if let decks = decks {
            return decks
        } else {
            return nil
        }
    }
    
    func showDeck(name: String) -> Deck? {
        if let deck = decks?.first(where: { $0.name == name
        }) {
            return deck
        } else {
            return nil
        }
        
    }
    
    func openDecks(name: String) -> Deck? {
        guard let decks = decks else {
            return nil
        }
        if let deck = decks.first(where: { $0.name == name }) {
            return deck
        } else {
            return nil
        }
    }
    
    mutating func createDeck(name: String) {
        decks?.append(Deck(name: name))
    }
    
    func hasDecks(name: String) -> Bool {
        return ((decks?.contains(where: { $0.name == name })) != nil)
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
}

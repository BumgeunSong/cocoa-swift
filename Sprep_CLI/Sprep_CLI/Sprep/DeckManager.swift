//
//  DeckManager.swift
//  Sprep_CLI
//
//  Created by Bumgeun Song on 2021/11/29.
//

import Foundation

enum DeckOption: String {
    case test = "test"
    case create = "new"
    case open = "open"
    case update = "change"
    case delete = "remove"
    case quit = "q"
    case unknown
    
    init(value: String) {
        switch value {
        case "test": self = .test
        case "new": self = .create
        case "change": self = .update
        case "remove": self = .delete
        case "open": self = .open
        case "q": self = .quit
        default: self = .unknown
        }
    }
}

struct DeckManager {
    
    var decks: [Deck]? = Dummy().decks
    
    
    func getDeckOption(_ value: String) -> (option: DeckOption, value: String) {
        return (DeckOption(value: value), value)
    }
    
    func showDecks() -> [Deck]? {
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

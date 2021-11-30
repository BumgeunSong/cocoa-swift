//
//  DeckManager.swift
//  Sprep_CLI
//
//  Created by Bumgeun Song on 2021/11/29.
//

import Foundation

enum DeckOption: String {
    case create = "new"
    case read = "show"
    case open = "open"
    case update = "change"
    case delete = "remove"
    case quit = "q"
    case unknown
    
    init(value: String) {
        switch value {
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
    
    var decks: [Deck]? = Dummy.decks
    
    let instruction: String = "-----Deck 명령어-----\nnew: 새로운 덱 만들기\nopen: 덱 열기\nchange: 덱 이름 바꾸기\nremove: 덱 이름 바꾸기\nq: 프로그램 종료하기"
    
    func getDeckOption(_ option: String) -> (option: DeckOption, value: String) {
        return (DeckOption(value: option), option)
    }
    
    func showDecks() -> String {
        if let decks = decks {
            return decks.map { $0.name }.joined(separator: "\n")
        } else {
            return "아직 덱이 없습니다. 덱을 만들어주세요."
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
        if var deck = decks?.first(where: { $0.name == name }) {
            deck.name = newName
        }
    }
    
    mutating func deleteDeck(name: String) {
        if let index = decks?.firstIndex(where: { $0.name == name }) {
            decks?.remove(at: index)
        }
    }
}

//
//  Deck.swift
//  Sprep_CLI
//
//  Created by Bumgeun Song on 2021/11/29.
//

import Foundation

enum CardOption: String {
    case create = "new"
    case update = "change"
    case delete = "remove"
    case quit = "q"
    case unknown
    
    init(value: String) {
        switch value {
        case "new": self = .create
        case "change": self = .update
        case "remove": self = .delete
        case "q": self = .quit
        default: self = .unknown
        }
    }
}

struct Deck {
    var cards: [Card]?
    var name: String
    
    let instruction: String = "-----Card 명령어-----\nnew: 새로운 카드 만들기\nchange: 카드 내용 바꾸기\nremove: 카드 삭제하기\nq: 뒤로 돌아가기"
    
    func getCardOption(_ option: String) -> (option: CardOption, value: String) {
        return (CardOption(value: option), option)
    }
    
    func showCards() -> String {
        if let cards = cards {
            return cards.map({ "ID: \($0.id)\n\($0.front)" })
                .joined(separator: "\n")
        } else {
            return "아직 카드가 없습니다. 카드를 만들어주세요."
        }
    }
    
    func showCard(id: String) -> String {
        if let cards = cards {
            return cards.map({ "ID: \($0.id)\n\($0.front)" })
                .joined(separator: "\n")
        } else {
            return "아직 카드가 없습니다. 카드를 만들어주세요."
        }
    }
    
    func hasCard(id: String) -> Bool {
        return ((cards?.contains(where: { $0.id.uuidString == id
        })) != nil)
    }
    
    mutating func createCard(front: String, back: String) {
        let newCard = Card(front: front, back: back, lastTestTime: Date())
        self.cards?.append(newCard)
    }
    
    func updateCard(cardID: Int) {
        
    }
    
    func deleteCard(cardID: Int) {
        
    }
    
    func getDueCards(date: Date) -> [Card]? {
        guard let cards = cards else { return nil }
        return cards.filter { $0.isDue(date: date) }
    }
}

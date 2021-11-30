//
//  CardView.swift
//  Sprep_CLI
//
//  Created by Bumgeun Song on 2021/11/30.
//

import Foundation

struct CardView {
    let consoleIO = ConsoleIO()
    var deck: Deck?
    
    mutating func enterCardView(deck: Deck) {
        self.deck = deck
        
        guard let deck = self.deck else {
            consoleIO.write("아직 Deck을 열지 않았습니다", to: .error)
            return
        }
        
        var shouldQuit = false
        
        while !shouldQuit {
            consoleIO.write("---------\(deck.name)---------")
            var currentCardsString = ""
            if let currentCards = deck.showCards() {
                currentCardsString = currentCards.map({ "Card ID: \($0.id)\n\($0.front)\n--------------------" })
                    .joined(separator: "\n")
            } else {
                currentCardsString = "아직 카드가 없습니다. 카드를 만들어주세요."
            }
            
            consoleIO.write(currentCardsString)
            consoleIO.write("----------Card 명령어----------\nnew: 새로운 카드 만들기\nchange: 카드 내용 바꾸기\nremove: 카드 삭제하기\nq: 뒤로 돌아가기")
            consoleIO.write("-----------------------------")
            consoleIO.write("명령어를 입력해주세요.")
            let (command, value) = deck.getCardCommand(consoleIO.getInput())
            
            switch command{
            case .create: newCard()
            case .update:
                print("update!")
                print("value: \(value), command:\(command)")
                updateCard()
            case .delete: deleteCard()
            case .quit: consoleIO.write("다음에 만나요!")
                shouldQuit = true
            case .unknown: consoleIO.write("\(value)는 잘못된 명령어입니다.", to: .error)
            }
        }
        
    }
    
    mutating func newCard() {
        guard let deck = deck else {
            consoleIO.write("아직 Deck을 열지 않았습니다", to: .error)
            return
        }
        
        consoleIO.write("빈 카드를 새로 가져왔습니다.")
        consoleIO.write("카드의 앞면 (질문)을 써주세요.")
        let front = consoleIO.getInput()
        consoleIO.write("카드의 뒷면 (답)을 써주세요.")
        let back = consoleIO.getInput()
        deck.createCard(front: front, back: back)
        consoleIO.write("'\(front)' 카드를 생성했습니다.")
    }
    
    func updateCard() {
        guard let deck = deck else {
            consoleIO.write("아직 Deck을 열지 않았습니다", to: .error)
            return
        }
        
        consoleIO.write("바꿀 카드의 ID를 입력하세요.")
        let cardID = consoleIO.getInput()
        var cardString = ""
        
        if let currentCard = deck.showCard(id: cardID) {
            
            cardString =  "\n-------------------\nCard ID: \(currentCard.id)\n\(currentCard.front)\n---------------------\n\(currentCard.back)\n---------------------"
            
        } else {
            consoleIO.write("\(cardID) 을(를) 찾지 못했습니다.", to: .error)
            return
        }
        
        consoleIO.write(cardString)
        consoleIO.write("앞면(질문)을(를) 무엇으로 바꾸시겠습니까?")
        let newCardFront = consoleIO.getInput()
        consoleIO.write("뒷면(답)을(를) 무엇으로 바꾸시겠습니까?")
        let newCardBack = consoleIO.getInput()
        deck.updateCard(cardID: cardID, front: newCardFront, back: newCardBack)
        consoleIO.write("\(cardID) 내용을 바꿨습니다.")
        
        if let currentCard = deck.showCard(id: cardID) {
            cardString =  "\n-------------------\nCard ID: \(currentCard.id)\n\(currentCard.front)\n\(currentCard.back)\n---------------------"
            consoleIO.write(cardString)
        }
    }
    
    
    func deleteCard() {
        guard let deck = deck else {
            consoleIO.write("아직 Deck을 열지 않았습니다", to: .error)
            return
        }
        
        consoleIO.write("삭제할 카드의 ID를 입력하세요.")
        let cardID = consoleIO.getInput()
        var cardString = ""
        
        
        if let currentCard = deck.showCard(id: cardID) {
            cardString =  "\n-------------------\nCard ID: \(currentCard.id)\n\(currentCard.front)\n---------------------\n\(currentCard.back)\n---------------------"
        } else {
            consoleIO.write("\(cardID) 을(를) 찾지 못했습니다.", to: .error)
            return
        }
        
        consoleIO.write(cardString)
        consoleIO.write("정말로 삭제하시겠습니까? (y/n)")
        let confirmed = consoleIO.getInput()
        if confirmed == "y" {
            deck.deleteCard(cardID: cardID)
            consoleIO.write("\(cardID)를 삭제했습니다.")
        } else {
            consoleIO.write("삭제가 취소되었습니다.")
        }
    }
    
}

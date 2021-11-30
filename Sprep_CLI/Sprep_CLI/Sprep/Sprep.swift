//
//  Sprep.swift
//  Sprep_CLI
//
//  Created by Bumgeun Song on 2021/11/29.
//

import Foundation


struct SprepView {
    let consoleIO = ConsoleIO()
    var deckManager = DeckManager()
    var testView =  TestView()
    var tester: Tester?
    var deck: Deck?
    
    mutating func enterDeckView() {
        consoleIO.write("\u{001B}[0;32mSprep에 오신 걸 환영합니다!\u{001B}[0;0m")
        
        var shouldQuit = false
        while !shouldQuit {
            consoleIO.write("-------------현재 Deck-------------")
            
            var deckString = ""
            if let currentDecks = deckManager.showDecks() {
                deckString = currentDecks.map({ "\($0.name) (오늘 공부해야할 질문: \($0.getDueCards()?.count ?? 0))" }).joined(separator: "\n")
            } else {
                deckString = "아직 덱이 없습니다. 덱을 만들어주세요."
            }
            consoleIO.write(deckString)
            consoleIO.write("------------------------------")
            consoleIO.write("----------Deck 명령어----------\ntest: 테스트 시작하기\nnew: 새로운 덱 만들기\nopen: 덱 열고 카드 보기\nchange: 덱 이름 바꾸기\nremove: 덱 이름 바꾸기\nq: 프로그램 종료하기")
            consoleIO.write("---------------------------")
            consoleIO.write("명령어를 입력해주세요.")
            let (option, value) = deckManager.getDeckOption(consoleIO.getInput())
            
            switch option {
            case .test: startTest()
            case .open: openDeck()
            case .create: createDeck()
            case .update: updateDeck()
            case .delete: deleteDeck()
            case .unknown: consoleIO.write("\(value)는 잘못된 명령어입니다.", to: .error)
            case .quit: consoleIO.write("다음에 만나요!")
                shouldQuit = true
        }
        
    }
    }
    
    mutating func startTest() {
        consoleIO.write("공부하고 싶은 덱 이름을 입력하세요.")
        let deckName = consoleIO.getInput()
        if let deck = deckManager.showDeck(name: deckName) {
            testView.enterTestView(deck: deck)
        } else {
            consoleIO.write("\(deckName) 덱을 찾을 수 없습니다.", to: .error)
            return
        }
    }
    
    mutating func openDeck() {
        consoleIO.write("---------현재 Deck----------")
        
        var deckString = ""
        if let currentDecks = deckManager.showDecks() {
            deckString = currentDecks.map({ "\($0.name) (오늘 공부해야할 질문: \($0.getDueCards()?.count ?? 0))" }).joined(separator: "\n")
        } else {
            deckString = "아직 덱이 없습니다. 덱을 만들어주세요."
            return
        }
        consoleIO.write(deckString)
        consoleIO.write("---------------------------")
        
        consoleIO.write("열고 싶은 덱 이름을 입력하세요.")
        let deckName = consoleIO.getInput()
        
        if let deck = deckManager.openDecks(name: deckName) {
            self.deck = deck
            self.enterCardView()
        } else {
            consoleIO.write("\(deckName) 덱을 찾을 수 없습니다.", to: .error)
        }
    }
    
    mutating func createDeck() {
        consoleIO.write("새로운 덱의 이름을 입력하세요.")
        let deckName = consoleIO.getInput()
        deckManager.createDeck(name: deckName)
        consoleIO.write("\(deckName)이(가) 생성되었습니다.")
    }
    
    func updateDeck() {
        consoleIO.write("바꿀 덱의 이름을 입력하세요.")
        let deckName = consoleIO.getInput()
        if deckManager.showDeck(name: deckName) != nil {
            consoleIO.write("\(deckName)을(를) 무엇으로 바꾸시겠습니까?")
        } else {
            consoleIO.write("\(deckName) 을(를) 찾지 못했습니다.", to: .error)
            return
        }
        let newDeckName = consoleIO.getInput()
        deckManager.updateDeck(name: deckName, newName: newDeckName)
        consoleIO.write("\(deckName)를 \(newDeckName)로 바꿨습니다.")
    }
    
    mutating func deleteDeck() {
        consoleIO.write("삭제할 덱 이름을 입력하세요.")
        let deckName = consoleIO.getInput()
        consoleIO.write("\(deckName)을(를) 정말 삭제하시겠습니까? (y/n)")
        if consoleIO.getInput() == "y" {
            deckManager.deleteDeck(name: deckName)
        } else {
            consoleIO.write("삭제를 취소했습니다.")
            return
        }
    }
    
    
    mutating func enterCardView() {
        guard let deck = deck else {
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
            let (option, value) = deck.getCardOption(consoleIO.getInput())
            
            switch option {
            case .create: newCard()
            case .update:
                print("update!")
                print("value: \(value), option:\(option)")
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

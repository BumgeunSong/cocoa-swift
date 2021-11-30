//
//  Sprep.swift
//  Sprep_CLI
//
//  Created by Bumgeun Song on 2021/11/29.
//

import Foundation


struct Sprep {
    let consoleIO = ConsoleIO()
    var deckManager = DeckManager()
    var deck: Deck?
    
    
    mutating func enterDeckMenu() {
        consoleIO.write("Sprep에 오신 걸 환영합니다!")
        
        var shouldQuit = false
        while !shouldQuit {
            consoleIO.write(deckManager.instruction)
            consoleIO.write("-----------------")
            consoleIO.write("명령어를 입력해주세요.")
            let (option, value) = deckManager.getDeckOption(consoleIO.getInput())
            
            switch option {
            case .open: openDeck()
            case .create: createDeck()
            case .update: updateDeck()
            case .delete: deleteDeck()
            case .unknown: consoleIO.write("\(value)는 잘못된 명령어입니다.", to: .error)
            case .quit: consoleIO.write("다음에 만나요!")
                shouldQuit = true
            default: consoleIO.write("명령어를 입력해주세요.")
            }
        }
        
    }
    
    mutating func openDeck() {
        consoleIO.write("----현재 Deck-----")
        consoleIO.write(deckManager.showDecks())
        consoleIO.write("-----------------")
        
        consoleIO.write("열고 싶은 덱 이름을 입력하세요.")
        let deckName = consoleIO.getInput()
        
        if let deck = deckManager.openDecks(name: deckName) {
            self.deck = deck
            self.enterCardMenu()
        } else {
            consoleIO.write("\(deckName) 덱을 찾을 수 없습니다.")
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
        if deckManager.hasDecks(name: deckName) {
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
    
    
    mutating func enterCardMenu() {
        guard let deck = deck else {
            consoleIO.write("아직 Deck을 열지 않았습니다", to: .error)
            return
        }
        
        
        
        var shouldQuit = false
        
        while !shouldQuit {
            consoleIO.write("----\(deck.name)----")
            consoleIO.write(deck.showCards())
            consoleIO.write(deck.instruction)
            consoleIO.write("-------------------")
            consoleIO.write("명령어를 입력해주세요.")
            let (option, value) = deck.getCardOption(consoleIO.getInput())
            
            switch option {
            case .create: newCard()
            case .update: updateCard()
            case .delete: deleteCard()
            case .quit: consoleIO.write("다음에 만나요!")
                shouldQuit = true
            case .unknown: consoleIO.write("\(value)는 잘못된 명령어입니다.", to: .error)
            }
        }
        
    }
    
    mutating func newCard() {
        guard var deck = deck else {
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
        guard var deck = deck else {
            consoleIO.write("아직 Deck을 열지 않았습니다", to: .error)
            return
        }
        
        consoleIO.write("바꿀 카드의 ID를 입력하세요.")
        let cardID = consoleIO.getInput()
        if deck.hasCard(id: cardID) {
            deck.show
            consoleIO.write("내용을(를) 무엇으로 바꾸시겠습니까?")
        } else {
            consoleIO.write("\(deckName) 을(를) 찾지 못했습니다.", to: .error)
            return
        }ㅌ
        let newDeckName = consoleIO.getInput()
        deckManager.updateDeck(name: deckName, newName: newDeckName)
        consoleIO.write("\(deckName)를 \(newDeckName)로 바꿨습니다.")
    }
    
    func deleteCard() {
        
    }
    
    
}

//
//  Sprep.swift
//  Sprep_CLI
//
//  Created by Bumgeun Song on 2021/11/29.
//

import Foundation


struct DeckView {
    let consoleIO = ConsoleIO()
    var deckManager = DeckManager()
    var testView =  TestView()
    var cardView = CardView()
    
    mutating func enterDeckView() {
        consoleIO.write("\u{001B}[0;32mSprep에 오신 걸 환영합니다!\u{001B}[0;0m")
        
        var shouldQuit = false
        while !shouldQuit {
            consoleIO.write("-------------현재 Deck-------------")
            
            var deckString = ""
            if let currentDecks = deckManager.showDecksAll() {
                deckString = currentDecks.map({ "\($0.name) (오늘 공부해야할 질문: \($0.getDueCards()?.count ?? 0))" }).joined(separator: "\n")
            } else {
                deckString = "아직 덱이 없습니다. 덱을 만들어주세요."
            }
            consoleIO.write(deckString)
            consoleIO.write("------------------------------")
            consoleIO.write("----------Deck 명령어----------\ntest: 테스트 시작하기\nnew: 새로운 덱 만들기\nopen: 덱 열고 카드 보기\nchange: 덱 이름 바꾸기\nremove: 덱 이름 바꾸기\nq: 프로그램 종료하기")
            consoleIO.write("---------------------------")
            consoleIO.write("명령어를 입력해주세요.")
            let (command, value) = deckManager.getDeckCommand(consoleIO.getInput())
            
            switch command {
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
        if let currentDecks = deckManager.showDecksAll() {
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
            cardView.enterCardView(deck: deck)
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
    
}


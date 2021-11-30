//
//  TestView.swift
//  Sprep_CLI
//
//  Created by Bumgeun Song on 2021/11/30.
//

import Foundation


struct TestView {
    var tester: Tester?
    let consoleIO = ConsoleIO()
    
    mutating func enterTestView(deck: Deck) {
        self.tester = Tester(deck: deck)
        guard var tester = self.tester else {
            consoleIO.write("Deck을 선택하지 않았습니다", to: .error)
            return
        }
        
        guard let queue = tester.getTestQueue() else {
            consoleIO.write("이 덱의 공부를 모두 끝내셨습니다!")
            return
        }
        
        for (index, card) in queue.enumerated() {
            tester.startWatch()
            consoleIO.write("-------Question \(index + 1) of \(queue.count)-------------")
            consoleIO.write(card.front)
            consoleIO.write("--------------------------------")
            consoleIO.write("잘 생각해본 후, 답을 보려면 아무 키나 입력해주세요")
            consoleIO.getInput()
            consoleIO.write("-------------Answer-------------")
            consoleIO.write(card.back)
            consoleIO.write("--------------------------------")
            tester.stopWatch()
            consoleIO.write("\(String(format: "%.1f", tester.getTimeSpent()))초 걸리셨습니다.")
            var shouldQuit = false
            while !shouldQuit {
                consoleIO.write("문제가 어려웠으면 'h', 보통이었으면 'm', 쉬웠으면 'e'를 입력해주세요.")
                
                let option = tester.getDifficultyOption(consoleIO.getInput())
                if option == .unknown {
                    consoleIO.write("잘못된 명령어를 입력하셨습니다.", to: .error)
                } else {
                    tester.writeDifficulty(card: card, difficulty: option)
                    
                    consoleIO.write("다음 문제로 넘어가겠습니다.")
                    shouldQuit = true
                }
            }
        }
        tester.updateDifficulty()
        consoleIO.write("테스트가 끝났습니다.")
    }
}

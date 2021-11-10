//
//  bullsAndCows.swift
//  week2_practice
//
//  Created by Bumgeun Song on 2021/11/10.
//

import Foundation

struct BullsAndCows {
    
    var number: [Int]?
    
    mutating func newGame() {
        number = Array(repeating: 0, count: 3).map({ n in
            Int.random(in: 0...9)
        })
        print("Let's start game!")
        if showGameScore() {
            print("Wow, you win! 🙌")
        } else {
            print("Game over ☠️")
        }
        print("The answer was... \(number!.map({ String($0) }).joined())")
    }
    
    func hit(guess: Int) -> (strikeCount: Int, ballCount: Int) {
        var strikeCount = 0
        var ballCount = 0
        let guessArray = [guess / 100, (guess % 100) / 10, guess % 10]
        if let numberArray = number {
            for n in 0..<numberArray.count {
                if guessArray[n] == numberArray[n] {
                    strikeCount += 1
                } else if numberArray.contains(guessArray[n]) {
                    ballCount += 1
                }
            }
        }
        return (strikeCount, ballCount)
    }
    
    func showGameScore() -> Bool {
        var trial = 0
        var strikeCount = 0
        var ballCount = 0
        
        while trial < 9 {
            print("You have \(9 - trial) chances left.")
            print("Enter your guess: ")
            let input = readLine()?.trimmingCharacters(in: .whitespacesAndNewlines)
            if input!.count == 3 {
                if let guess = Int(input!) {
                    trial += 1
                    (strikeCount, ballCount) = hit(guess: guess)
                    if strikeCount >= 3 {
                        return true
                    }
                    print("\(strikeCount) strike, \(ballCount) ball")
                } else {
                    print("You should enter three numbers")
                }
            } else {
                print("You should enter three numbers")
            }
        }
        return false
    }
}

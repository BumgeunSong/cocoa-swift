//
//  main.swift
//  LadderGame
//
//  Created by Bumgeun Song on 2021/11/04.
//

import Foundation

struct LadderGame {
    
    var numberOfPeople: Int = 0
    var height: Int = 4
    var myladder: [[Int]] = []
    
    mutating func startGame() {
        if let numberOfPeople = getNumberOfPeople() {
            myladder = createLadder(numberOfPeople, self.height)
            printLadder(myladder)
        }
    }
    
    func getNumberOfPeople() -> Int? {
        print("Let's start Ladder game!")
        print("Please enter a number of people:")
        
        var input = readLine() ?? ""
        input = input.trimmingCharacters(in: .whitespacesAndNewlines)
        
        let inputNumber = Int(input) ?? 0
        if inputNumber < 2 || inputNumber > 8 {
            print("This is not a valid number. A number should be greater than 2 and less than 8")
            return nil
        } else {
            return inputNumber
        }
    }
    
    func createLadder(_ numberOfPeople: Int, _ height: Int) -> [[Int]] {
        var ladder: [[Int]] = []
        for _ in 1...height {
            var row: [Int] = []
            for _ in 1..<numberOfPeople {
                row.append(Int.random(in: 0...1))
            }
            ladder.append(row)
        }
        return ladder
    }
    
    func printLadder(_ ladder: [[Int]]) {
        for row in ladder {
            var rowString = "|"
            for step in row {
                if step == 1 {
                    rowString += "-"
                } else {
                    rowString += " "
                }
                rowString += "|"
            }
            print(rowString)
        }
    }

}
var myLadderGame = LadderGame()
myLadderGame.startGame()




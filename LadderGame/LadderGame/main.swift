//
//  main.swift
//  LadderGame
//
//  Created by Bumgeun Song on 2021/11/04.
//

import Foundation

func getNumberOfPeople() -> Int? {
    print("Let's start Ladder game!")
    print("Please enter a number of people")
    var input = readLine() ?? ""
    input = input.trimmingCharacters(in: .whitespacesAndNewlines)
    let numberOfPeople = Int(input) ?? 0
    if numberOfPeople < 2 || numberOfPeople > 8 {
        print("This is not a valid number. A number should be greater than 2 and less than 8")
        return nil
    } else {
        return numberOfPeople
    }
}

func printLadder(_ numberOfPeople: Int, height: Int) {
    var ladder: [[Int]] = []
    for _ in 1...height {
        var row: [Int] = []
        for _ in 1..<numberOfPeople {
            row.append(Int.random(in: 0...1))
        }
        ladder.append(row)
    }
    print(ladder)
}

if let numberOfPeople = getNumberOfPeople() {
    printLadder(numberOfPeople, height: 4)
}




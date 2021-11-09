//
//  ArrayPractice.swift
//  week2_practice
//
//  Created by Bumgeun Song on 2021/11/08.
//

import Foundation

struct ArrayPractice {
    func fillArray() -> [[Int]] {
        // 1. 비어있는 변수, 타입 선언
        // 2. for 문으로 채우기
        // 3. 해당 변수 return.
        
        var result: [[Int]] = []

        for row in 1...5 {
            var rowArray: [Int] = []

            for col in 1...5 {
                if col <= row {
                    rowArray.append(5 * (row - 1) + col)
                }
            }
            result.append(rowArray)
        }
        return result
    }
    
    func printArray(array: [[Int]]) {
        for row in array {
            print(row)
        }
    }
    
    func setBoolArray(max: Int) -> [[Bool]] {
        var result: [[Bool]] = []
        for row in 1...max {
            var rowArray: [Bool] = []
            for col in 1...max {
                if max - row >= col {
                    rowArray.append(false)
                } else {
                    rowArray.append(true)
                }
            }
            result.append(rowArray)
        }
        return result
    }
    
    func printArray(array: [[Bool]], newChar: String) {
        for row in array {
            let newRow = row.map { bool -> String in
                if bool {
                    return newChar
                } else {
                    return " "
                }
            }
            print(newRow)
        }
    }
}

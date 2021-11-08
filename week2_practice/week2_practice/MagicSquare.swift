//
//  MagicSqaure.swift
//  week2_practice
//
//  Created by Bumgeun Song on 2021/11/08.
//

import Foundation


struct MagicSquare {
    var magicSquare: Array<Array<Int>> = []
    var pointer: (x: Int, y: Int) = (0, 0)
    var row: Int = 0
    
    mutating func makeMagicSquare(row: Int) -> Array<Array<Int>>? {
        if row != 3 && row != 5 {
            print("Only 3 X 3 and 5 X 5 is possible")
            return nil
        }
        
        self.row = row
        self.pointer = ((row - 1) / 2, 0)
        magicSquare = []
        for _ in 1...row {
            magicSquare.append(Array(repeating: 0, count: row))
        }
        
        for number in 1...row*row {
            if magicSquare[pointer.y][pointer.x] != 0 {
                move2DownAndLeft()
                moveInside()
            }
            
            magicSquare[pointer.y][pointer.x] = number

            moveUpAndRight()
            moveInside()
        }
        return magicSquare
    }
    
    mutating func moveInside() {
        if pointer.x >= row  {
            pointer.x = pointer.x - row
        } else if pointer.x < 0 {
            pointer.x = pointer.x + row
        }
        
        if pointer.y >= row {
            pointer.y = pointer.y - row
        } else if pointer.y < 0 {
            pointer.y = pointer.y + row
        }
    }
    
    mutating func moveUpAndRight() {
        pointer.y -= 1
        pointer.x += 1
    }
    
    mutating func move2DownAndLeft() {
        pointer.y += 2
        pointer.x -= 1
    }
    
    
    func printMagicSquare(_ magicSquare: Array<Array<Int>>?) {
        if magicSquare != nil {
            print("This is magic sqaure.")
            print("The sum of the numbers is all same in each row, column, and diagonal.")
            print(magicSquare!)
        }
    }
}



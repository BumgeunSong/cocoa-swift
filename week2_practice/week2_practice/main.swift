//
//  main.swift
//  week2_practice
//
//  Created by Bumgeun Song on 2021/11/08.
//

import Foundation
//
//var myArray = ArrayPractice()
//myArray.printArray(array: myArray.fillArray())
//myArray.printArray(array: myArray.setBoolArray(max: 5), newChar: "$")
//
//var myMagicSquare = MagicSquare()
//myMagicSquare.printMagicSquare(myMagicSquare.makeMagicSquare(row: 3))
//myMagicSquare.printMagicSquare(myMagicSquare.makeMagicSquare(row: 5))
//myMagicSquare.printMagicSquare(myMagicSquare.makeMagicSquare(row: 7))

var myValidator = Validator()
print(myValidator.IDValidator(id: "Hello-world12"))
print(myValidator.IDValidator(id: "Hello-world1231114"))
print(myValidator.IDValidator(id: "Hello45-world1234"))
print(myValidator.IDValidator(id: "showme$$"))

print(Character("-").asciiValue!)

extension String {
    subscript(_ i: Int) -> String {
        return String(self[index(startIndex, offsetBy: i)])
    }
}

//
//  main.swift
//  week2_practice
//
//  Created by Bumgeun Song on 2021/11/08.
//

import Foundation

var myArray = ArrayPractice() // class , struct intitalizer
myArray.printArray(array: myArray.fillArray())
myArray.printArray(array: myArray.setBoolArray(max: 5), newChar: "$")

var myMagicSquare = MagicSquare()
myMagicSquare.printMagicSquare(myMagicSquare.makeMagicSquare(row: 3))
myMagicSquare.printMagicSquare(myMagicSquare.makeMagicSquare(row: 5))
myMagicSquare.printMagicSquare(myMagicSquare.makeMagicSquare(row: 7))


var myValidator = Validator()

//print(myValidator.IDValidator(id: "Hello-world12"))
//print(myValidator.IDValidator(id: "Hello-world1231114"))
//print(myValidator.IDValidator(id: "Hello45-world1234"))
//print(myValidator.IDValidator(id: "showme$$"))

//print("level: ", myValidator.passwordValidator(password: "1182"))
//print("level: ", myValidator.passwordValidator(password: "abcd"))
//print("level: ", myValidator.passwordValidator(password: "iosdeveloper"))
//print("level: ", myValidator.passwordValidator(password: "123231jb4a2"))
//print("level: ", myValidator.passwordValidator(password: "airplane13!@"))

print(myValidator.socialNumberValidator(socialNumber: "930615-1010845"))
print(myValidator.socialNumberValidator(socialNumber: "681128-2466713"))
print(myValidator.socialNumberValidator(socialNumber: "950625-1012835"))
print(myValidator.socialNumberValidator(socialNumber: "950625-abced"))

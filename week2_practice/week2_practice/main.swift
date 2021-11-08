//
//  main.swift
//  week2_practice
//
//  Created by Bumgeun Song on 2021/11/08.
//

import Foundation
//
var myArray = ArrayPractice()
//myArray.printArray(array: myArray.fillArray())
//myArray.printArray(array: myArray.setBoolArray(max: 5), newChar: "$")

//print(myArray.makeMagicSquare(row: 3))


var myMagicSquare = MagicSquare()
myMagicSquare.printMagicSquare(myMagicSquare.makeMagicSquare(row: 3))
myMagicSquare.printMagicSquare(myMagicSquare.makeMagicSquare(row: 5))
myMagicSquare.printMagicSquare(myMagicSquare.makeMagicSquare(row: 7))

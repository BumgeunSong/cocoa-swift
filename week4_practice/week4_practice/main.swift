//
//  main.swift
//  week4_practice
//
//  Created by Bumgeun Song on 2021/11/24.
//

import Foundation

print("Let's get started")

// MARK: - Test FileFinder

let finder = FileFinder()
//
//if let files = finder.findFiles(at: "/Users/bumgeunsong/Coding") {
//    print(files)
//    print(finder.sort(in: files))
//}
//
//print(finder.isExist(filename: "cocoa-swift", at: "/Users/bumgeunsong/Coding"))
//print(finder.areExist(filenames: ["algorithm-practice", "iOS_study", "cocoa-swift", "card-game", "test.txt"], at: "/Users/bumgeunsong/Coding"))
//print(finder.findFiles(fileExtension: "md", at: "/Users/bumgeunsong/Coding/cocoa-swift")!)

// MARK: - Test StudentManager

var path = "/Users/bumgeunsong/Coding/cocoa-swift/week4_practice/week4_practice/example.csv"

if var studentManager = StudentManager(CSVPath: path) {
    studentManager.add(name: "Eddy", email: "code1195@gmail.com", language: "Swift", grade: 2)

    print("Find Eddy")
    print(studentManager.findBy(name: "Eddy")!)

    print("Current state")
    print(studentManager.students!)

    print("Remove Eddy")
    print(studentManager.removeBy(email: "code1195@gmail.com"))

    print("Current state")
    print(studentManager.students!)

}

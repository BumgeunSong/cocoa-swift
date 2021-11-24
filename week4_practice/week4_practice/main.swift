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

//let files = finder.findFiles(fileExtension: "csv", at: "/Users/bumgeunsong/Coding/cocoa-swift/week4_practice")
//)

let CSVString = "name, email, language, grade\nJK, jk@codesquad.kr, swift, 5\nhead, head@codesquad.kr, JS, 3\nhonux, honux@codesquad.kr, SQL, 1\ncrong, crong@codesquad.kr, TS, 2"

let studentManager = StudentManager(CSVString: CSVString)




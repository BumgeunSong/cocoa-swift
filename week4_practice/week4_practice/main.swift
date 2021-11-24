//
//  main.swift
//  week4_practice
//
//  Created by Bumgeun Song on 2021/11/24.
//

import Foundation

print("Let's get started")

// MARK: - Test findFiles()

if let files = findFiles(at: "/Users/bumgeunsong/Coding") {
    print(files)
    print(sort(in: files))
}

print(isExist(filename: "cocoa-swift", at: "/Users/bumgeunsong/Coding"))


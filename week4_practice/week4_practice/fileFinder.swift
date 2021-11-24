//
//  fileFinder.swift
//  week4_practice
//
//  Created by Bumgeun Song on 2021/11/24.
//

import Foundation

let fm = FileManager.default

func findFiles(at path: String) -> Array<String>? {
    do {
        let files = try fm.contentsOfDirectory(atPath: path)
        return files
    } catch {
        print("Failed to read directory")
        return nil
    }
}


func isExist(filename: String, at path: String) -> Bool {
    if let files = findFiles(at: path) {
        for file in files {
            if file == filename {
                print("Found \(file)")
                return true
            }
        }
    }
    print("Failed to find \(filename)")
    return false
}

func sort(in files: Array<String>) -> Array<String> {
    return ["String"]
}

func areExist(filenames: Array<String>, at path: String) -> Array<Bool> {
    return [true]
}

func isExist(filename: String, format: String, at path: String) -> Bool {
    return true
}

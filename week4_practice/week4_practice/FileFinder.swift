//
//  fileFinder.swift
//  week4_practice
//
//  Created by Bumgeun Song on 2021/11/24.
//

import Foundation


struct FileFinder {
    let fm = FileManager.default
    
    func findFiles(at path: String) -> Array<String>? {
        do {
            let files = try fm.contentsOfDirectory(atPath: path)
            return files
        } catch {
            print("Failed to read directory")
            print(error.localizedDescription)
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
        return files.sorted()
    }
    
    func areExist(filenames: Array<String>, at path: String) -> Array<Bool> {
        return filenames.map { isExist(filename: $0, at: path) }
    }
    
    func findFiles(fileExtension: String, at path: String) -> Array<String>? {
        do {
            return try fm.contentsOfDirectory(atPath: path)
                .filter { $0.hasSuffix(".\(fileExtension)") }
        } catch {
            print("Failed to read directory")
            print(error.localizedDescription)
            return nil
        }
    }
}








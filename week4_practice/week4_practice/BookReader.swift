//
//  BookReader.swift
//  week4_practice
//
//  Created by Bumgeun Song on 2021/11/24.
//

import Foundation

struct BookReader {
    
    var bookString: String = ""
    
    init?(filePath: String) {
        do {
            let bookString = try String(contentsOf: URL(fileURLWithPath: filePath)).trimmingCharacters(in: .whitespacesAndNewlines)
            self.bookString = bookString
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
    
    
}

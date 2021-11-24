//
//  BookReader.swift
//  week4_practice
//
//  Created by Bumgeun Song on 2021/11/24.
//

import Foundation

class BookReader {
    
    var targets = ["대중", "경제", "재산", "자유", "국제",
                   "시장", "사상", "부자", "학자", "개인",
                   "욕망", "생활", "자원", "사람", "노동",
                   "인물", "소비", "사회", "이론", "새로운"]
    
    var bookString: String = ""
    var thread: Thread? = nil
    
    init?(filePath: String) {
        do {
            let bookString = try String(contentsOf: URL(fileURLWithPath: filePath)).trimmingCharacters(in: .whitespacesAndNewlines)
            self.bookString = bookString
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
    
    func countAll() {
        for target in targets {
            doTimeConsumingSearch(word: target)
        }
    }
    
    func countAllOneThread() {
        for target in targets {
            count(word: target)
        }
    }
    
    func doTimeConsumingSearch(word: String) {
        thread = Thread(target: self,
                   selector: #selector(BookReader.count), object: word)
        thread?.start()
    }
    
    @objc func count(word: String) {
        autoreleasepool { () in
            print("\(word): \(bookString.components(separatedBy: word).count - 1)번 등장")
            print("Other thread is running...")
        }
    }
    
}


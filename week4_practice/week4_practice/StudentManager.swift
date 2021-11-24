//
//  CSV.swift
//  week4_practice
//
//  Created by Bumgeun Song on 2021/11/24.
//

import Foundation

struct StudentManager {
    var urlText = "/Users/bumgeunsong/Coding/cocoa-swift/week4_practice/week4_practice"

    var students: [Dictionary<String, Any>]
    
    init(CSVString: String) {
        var body = CSVString.components(separatedBy: "\n").map{ $0.components(separatedBy: ", ")}
        let header = body.removeFirst()
        
        var student = [Dictionary<String, Any>]()
        for rowIndex in 0..<body.count {
            var row: [String: Any] = [:]
            for colIndex in 0..<body[0].count {
                if let grade = Int(body[rowIndex][colIndex]) {
                    row[header[colIndex]] = grade
                } else {
                    row[header[colIndex]] = body[rowIndex][colIndex]
                }
            }
            student.append(row)
        }
        print(student)
        self.students = student
    }
    
    func readCSV(text: String) {
        
    }
    
    func add(name: String, email: String, language: String, grade: Int) {
        
    }
    
    func findBy(name: String) -> Dictionary<String,Any> {
        return ["Dummy": "Dummy"]
    }
    
    func removeBy(email: String) -> Bool {
        return false
    }
    
    func writeCSV(to file: String) -> Bool {
        return false
    }
}

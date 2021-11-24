//
//  CSV.swift
//  week4_practice
//
//  Created by Bumgeun Song on 2021/11/24.
//

import Foundation

struct StudentManager {
    
    var students: [Dictionary<String, Any>]
    
    init(CSV: String) {
        self.students = [["Dummy": "Dummy"]]
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

//
//  CSV.swift
//  week4_practice
//
//  Created by Bumgeun Song on 2021/11/24.
//

import Foundation

struct StudentManager {
    var students: Array<Dictionary<String, Any>>?
    
    init?(CSVPath: String) {
        do {
            let CSVString = try String(contentsOf: URL(fileURLWithPath: CSVPath)).trimmingCharacters(in: .whitespacesAndNewlines)
            self.students = parse(CSVString: CSVString)
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
    
    func parse(CSVString: String) -> Array<Dictionary<String, Any>> {
        var body = CSVString.components(separatedBy: "\n").map{ $0.components(separatedBy: ", ")}
        let header = body.removeFirst()
        
        var parsedData = [Dictionary<String, Any>]()
        
        for rowIndex in 0..<body.count {
            var row: [String: Any] = [:]
            for colIndex in 0..<body[0].count {
                if let grade = Int(body[rowIndex][colIndex]) {
                    row[header[colIndex]] = grade
                } else {
                    row[header[colIndex]] = body[rowIndex][colIndex]
                }
            }
            parsedData.append(row)
        }
        return parsedData
    }
    
    
    mutating func add(name: String, email: String, language: String, grade: Int) {
        self.students?.append(["name": name, "email": email, "language": language, "grade": grade])
    }
    
    func findBy(name: String) -> Dictionary<String,Any>? {
        guard let result = self.students?.first(where: { row in
            guard let nameValue = row["name"] as? String else { return false }
            return nameValue == name
        }) else { return nil }
        
        return result
    }
    
    mutating func removeBy(email: String) -> Bool {
        if let index = self.students?.firstIndex(where: { row in
            guard let nameValue = row["email"] as? String else { return false }
            return nameValue == email
        }) {
            print("Remove \(String(describing: self.students?[index]))")
            self.students?.remove(at: index)
            return true
        } else {
            print("Faild to find \(email)")
            return false
        }
        
    }
    
    func writeCSV(to file: String) -> Bool {
        return false
    }
}

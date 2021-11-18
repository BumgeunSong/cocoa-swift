//
//  Parenthesis.swift
//  week3_practice
//
//  Created by Bumgeun Song on 2021/11/17.
//

import Foundation


enum ParenthesisType {
    case round
    case square
    case curly
    
    var left: String {
        switch self {
        case .round:
            return "("
        case .square:
            return "["
        case .curly:
            return "{"
        }
    }
    
    var right: String {
        switch self {
        case .round:
            return ")"
        case .square:
            return "]"
        case .curly:
            return "}"
        }
    }
}
 
struct Parenthesis {
    
    var type: ParenthesisType
    
    func generate(with count: Int) -> Array<String> {
        
        if count % 2 != 0 {
            print("Number of arenthesis should be even.")
            return []
        }
        
        var result: Array<String> = []
        func recursion(input: String, occurrence: (opener: Int, closer: Int)) {
            if input.count >= count {
                result.append(input)
                return
            }

            if occurrence.opener < (count / 2) {
                let newOccurrence = (occurrence.opener + 1, occurrence.closer)
                recursion(input: "\(input)\(type.left)", occurrence: newOccurrence)
            }
            
            if occurrence.closer < occurrence.opener {
                let newOccurrence = (occurrence.opener, occurrence.closer + 1)
                recursion(input: "\(input)\(type.right)", occurrence: newOccurrence)
            }
            return
        }
        recursion(input: "", occurrence: (opener: 0, closer: 0))
        return result
    }
    
    func analyze(with value: String) -> Bool {
        var stack: [Character] = []
        
        for bracket in value {
            if bracket == Character(type.left) {
                stack.append(bracket)
            } else {
                if stack.isEmpty {
                    return false
                } else {
                    stack.removeLast()
                }
            }
        }
        return stack.isEmpty ? true : false
    }
}



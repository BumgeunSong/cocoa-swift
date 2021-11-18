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
    
    func generate(with length: Int) -> Array<String> {
        
        if length % 2 != 0 {
            print("Number of arenthesis should be even.")
            return []
        }
        
        var result: Array<String> = []
        func recursion(input: String, counter: (leftBracket: Int, rightBracket: Int)) {
            if input.count >= length {
                result.append(input)
                return
            }

            if counter.leftBracket < (length / 2) {
                let newcounter = (counter.leftBracket + 1, counter.rightBracket)
                recursion(input: "\(input)\(type.left)", counter: newcounter)
            }
            
            if counter.rightBracket < counter.leftBracket {
                let newcounter = (counter.leftBracket, counter.rightBracket + 1)
                recursion(input: "\(input)\(type.right)", counter: newcounter)
            }
                          
            return
        }
        recursion(input: "", counter: (leftBracket: 0, rightBracket: 0))
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



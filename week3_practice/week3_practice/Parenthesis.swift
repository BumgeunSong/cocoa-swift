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
    
    var leftBracket: String {
        switch self {
        case .round:
            return "("
        case .square:
            return "["
        case .curly:
            return "{"
        }
    }
    
    var rightBracket: String {
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
            print("Number of parenthesis should be even.")
            return []
        }
        
        var result: Array<String> = []
        func recursion(input: String, counter: (leftBracket: Int, rightBracket: Int)) {
            if input.count >= length {
                result.append(input)
                return
            }

            // 규칙 1. 여는 괄호는 여는 괄호의 갯수가 전체 길이의 절반 이하일 때만 추가 가능
            if counter.leftBracket < (length / 2) {
                let newcounter = (counter.leftBracket + 1, counter.rightBracket)
                recursion(input: "\(input)\(type.leftBracket)", counter: newcounter)
            }
            
            // 규칙 2. 닫는 괄호는 여는 괄호가 닫는 괄호보다 많을 때만 추가 가능
            if counter.rightBracket < counter.leftBracket {
                let newcounter = (counter.leftBracket, counter.rightBracket + 1)
                recursion(input: "\(input)\(type.rightBracket)", counter: newcounter)
            }
                          
            return
        }
        recursion(input: "", counter: (leftBracket: 0, rightBracket: 0))
        return result
    }
    
    func analyze(with value: String) -> Bool {
        var stack: [Character] = []
        
        for bracket in value {
            if bracket == Character(type.leftBracket) {
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



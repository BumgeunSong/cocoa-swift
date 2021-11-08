//
//  Validator.swift
//  week2_practice
//
//  Created by Bumgeun Song on 2021/11/08.
//

import Foundation



struct Validator {
    func IDValidator(id: String) -> Bool {
//        5글자 미만이거나 24글자 이상이면 실패

//        같은 숫자가 연속해서 3회 이상 나오면 실패 111, 222
//        숫자가 연번으로 3개나오면 실패 123, 234
//        위 조건을 모두 통과하면 성공
        if id.count < 5 || id.count > 24 {
            return false
        }

//        영문 대소문자, 숫자, -만 포함 가능하고 그 외에는 실패
        let idPattern = "[A-Za-z0-9-]+"
        if let validRange = id.range(of: idPattern, options: .regularExpression) {
            if id != id[validRange] {
                return false
            }
        }
        
        for char in id {
            if !char.isLetter && !char.isNumber && !(char.asciiValue! == 45) {
                return false
            }
        }
        
        var idArray: [Int] = []
        for char in id {
            if char.isWholeNumber {
                idArray.append(char.wholeNumberValue!)
            }
        }
        if !idArray.isEmpty {
            for index in 1..<idArray.count - 1 {
                let prev = idArray[index - 1]
                let next = idArray[index + 1]
                let current = idArray[index]
                print(prev, current, next)
                if prev == current && next == current {
                    return false
                }
                if prev == current - 1 && next == current + 1 {
                    return false
                }
            }
        }
        return true
    }
}

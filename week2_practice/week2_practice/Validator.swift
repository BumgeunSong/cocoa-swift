//
//  Validator.swift
//  week2_practice
//
//  Created by Bumgeun Song on 2021/11/08.
//

import Foundation



struct Validator {
    func IDValidator(id: String) -> Bool {
        
        // 5글자 미만이거나 24글자 이상이면 실패
        if id.count < 5 || id.count > 24 {
            return false
        }
        
        // 영문 대소문자, 숫자, -만 포함 가능하고 그 외에는 실패
        for char in id {
            if !char.isLetter && !char.isNumber && !(char.asciiValue! == 45) {
                return false
            }
        }
        
        // idValidator
        // 같은 숫자가 연속해서 3회 이상 나오면 실패 111, 222
        // 숫자가 연번으로 3개나오면 실패 123, 234
        
        // String의 한 글자씩 loop를 돌리면서, 해당 string의 앞글자 (현재 index - 1)과 다음 글자 (현재 index + 1) 에 접근할 수 있는 방법이 뭐가 있을까?
        //        for (index, char) in id.enumerated() {
        //            print(id[index + 1])
        //        }
        //
        //
        
        
        var idArray: [Int] = []
        for char in id {
            if char.isWholeNumber {
                idArray.append(char.wholeNumberValue!)
            }
        }
        if !idArray.isEmpty {
            for index in 1..<idArray.count - 1 {
                let current = idArray[index], prev = idArray[index - 1], next = idArray[index + 1]
                
                if prev == current && next == current {
                    return false
                }
                if prev == current - 1 && next == current + 1 {
                    return false
                }
            }
        }
        // 위 조건을 모두 통과하면 성공
        return true
    }
    
    func passwordValidator(password: String) -> Int {
        var level = 3
        
        if password.count < 8 {
            if password.range(of: "^[0-9]*$", options: .regularExpression) != nil {
                level = 1
            }
            if password.range(of: "^[a-zA-Z]*$", options: .regularExpression) != nil {
                level = 2
            }
        } else {
            if password.range(of: "(?=.*[A-Za-z])(?=.*[\\d])", options: .regularExpression) != nil {
                level = 4
            }
            if password.range(of: "^(?=.*[A-Za-z])(?=.*[\\d])(?=.*[~!@#\\$%\\^&\\*])[\\w~!@#\\$%\\^&\\*]{8,}$", options: .regularExpression) != nil {
                level = 5
            }
        }
        return level
    }
    
    func socialNumberValidator(socialNumber: String) -> Bool {
        if socialNumber.range(of: "^[0-9-]*$", options: .regularExpression) != nil {
            let nums = socialNumber.filter { char in
                return char.isNumber
            }
            
            var index = 0
            let multiplier = [2,3,4,5,6,7,8,9,2,3,4,5]
            var result = nums.dropLast().reduce(0) { acc, cur in
                let sum = acc + (cur.wholeNumberValue! * multiplier[index])
                index += 1
                return sum
            }
            
            result = (11 - (result % 11)) % 10
            
            if result == socialNumber.last?.wholeNumberValue {
                return true
            }
        } else {
            print("Not a valid format!")
        }
        return false
    }
    
}

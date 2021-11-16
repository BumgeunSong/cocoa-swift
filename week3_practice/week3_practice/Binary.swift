//
//  Binary.swift
//  week3_practice
//
//  Created by Bumgeun Song on 2021/11/15.
//

import Foundation

class Binary {
    private var values: Array<String>
    
    init(with total: Int) {
        // total 값과 같은 비트 길이를 가지는 2진수 숫자를 생성해서 내부 private values 배열에 초기화한다.
        var result: [String] = []
        func recursion(input: String) {
            if input.count >= 5 {
                result.append(input)
                return
            }
            recursion(input: "\(input)0")
            recursion(input: "\(input)1")
            return
        }
        recursion(input: "")
        values = result
    }
    
    var count: Int {
        return values.count
    }
    
    func find(by bitcount: Int) -> Array<String> {
        // 초기화한 values 배열 값 중에서 1인 비트 개수가 bitcount개 있는 값만 배열에 문자열로 담아서 return 한다.
        return values.filter { binary in
            let count1 = binary.filter { $0 == "1" }.count
            return count1 == bitcount
        }
    }
}

extension Binary: CustomStringConvertible {
    var description: String {
        let string = values.reduce("") { partialResult, value in
            return "\(partialResult)'\(value)',"
        }
        return "[\(string)]"
    }
}

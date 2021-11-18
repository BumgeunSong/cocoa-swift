//
//  CalculatorLogic.swift
//  CalculatorApp
//
//  Created by Bumgeun Song on 2021/11/17.
//

import Foundation

struct CalculatorLogic {
    
    func calculate(_ n1: Double, _ n2: Double, op: String) -> Double? {
        switch op {
        case "+":
            return n1 + n2
        case "−":
            return n1 - n2
        case "×":
            return n1 * n2
        case "÷":
            return n1 / n2
        default:
            return nil
        }
    }
}

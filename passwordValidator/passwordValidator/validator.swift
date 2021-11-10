//
//  validator.swift
//  passwordValidator
//
//  Created by Bumgeun Song on 2021/11/10.
//

import Foundation
import UIKit

struct Validator {
    func validatePassword(password: String) -> Int {
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
    
    func getLevelColor(level: Int) -> UIColor? {
        switch level {
        case 1:
            return UIColor.systemRed
        case 2:
            return UIColor.systemOrange
        case 3:
            return UIColor.systemYellow
        case 4:
            return UIColor.systemTeal
        case 5:
            return UIColor.systemGreen
        default:
            return nil
        }
    }
}

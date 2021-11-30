//
//  File.swift
//  Sprep_CLI
//
//  Created by Bumgeun Song on 2021/11/29.
//

import Foundation

enum DifficultyOption: String {
    case easy = "e"
    case medium = "m"
    case hard = "h"
    case unknown
    
    init(value: String) {
        switch value {
        case "e": self = .easy
        case "m": self = .medium
        case "h": self = .hard
        default: self = .unknown
        }
    }
}

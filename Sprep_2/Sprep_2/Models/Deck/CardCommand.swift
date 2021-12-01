//
//  CardCommand.swift
//  Sprep_2
//
//  Created by Bumgeun Song on 2021/12/01.
//

import Foundation

enum CardCommand: String {
    case create = "new"
    case update = "change"
    case delete = "remove"
    case quit = "q"
    case unknown
    
    init(value: String) {
        switch value {
        case "new": self = .create
        case "change": self = .update
        case "remove": self = .delete
        case "q": self = .quit
        default: self = .unknown
        }
    }
}

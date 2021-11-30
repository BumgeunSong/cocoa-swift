//
//  DeckCommand.swift
//  Sprep_CLI
//
//  Created by Bumgeun Song on 2021/11/30.
//

import Foundation

enum DeckCommand: String {
    case test = "test"
    case create = "new"
    case open = "open"
    case update = "change"
    case delete = "remove"
    case quit = "q"
    case unknown
    
    init(value: String) {
        switch value {
        case "test": self = .test
        case "new": self = .create
        case "change": self = .update
        case "remove": self = .delete
        case "open": self = .open
        case "q": self = .quit
        default: self = .unknown
        }
    }
}

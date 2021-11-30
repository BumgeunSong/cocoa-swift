//
//  Panagram.swift
//  Sprep_CLI
//
//  Created by Bumgeun Song on 2021/11/29.
//

import Foundation

class Panagram {
    let consoleIO = ConsoleIO()
    
    func staticMode() {
        consoleIO.printUsage()
        let argCount = CommandLine.argc
        let argument = CommandLine.arguments[1]
        let optionSubstring = argument.suffix(from: argument.index(argument.startIndex, offsetBy: 1))
        let (option, value) = getOption(String(optionSubstring))
        consoleIO.write("There is \(argCount) arguments. Option: \(option) value: \(value)")
    }
    
    func interactiveMode() {
        consoleIO.write("Welcome to Panagram. This program checks if an input is an anagram or palidrome.")
        
        var shouldQuit = false
        while !shouldQuit {
            consoleIO.write("Type 'a' to check for anagrams or 'p' for palidromes")
            consoleIO.write("or Type 'q' to quit.")
            let (option, value) = getOption(consoleIO.getInput())
            consoleIO.write("Option: \(option)")
            consoleIO.write("Value: \(value)")
            switch option {
            case .quit:
                shouldQuit = true
            default:
                shouldQuit = false
            }
        }
    }
    
    func getOption(_ option: String) -> (option: OptionType, value: String) {
        return (OptionType(value: option), option)
    }
}


enum OptionType: String {
    case palindrome = "p"
    case anagram = "a"
    case help = "h"
    case quit = "q"
    case unknown
    
    init(value: String) {
        switch value {
        case "a": self = .anagram
        case "p": self = .palindrome
        case "h": self = .help
        case "q": self = .quit
        default: self = .unknown
        }
    }
}

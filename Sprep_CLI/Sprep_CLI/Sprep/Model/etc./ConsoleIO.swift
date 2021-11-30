//
//  ConsoleIO.swift
//  Sprep_CLI
//
//  Created by Bumgeun Song on 2021/11/29.
//

import Foundation

enum OutputType {
    case error
    case standard
}

class ConsoleIO {
    func write(_ message: String, to: OutputType = .standard) {
        switch to {
        case .standard:
            print("\(message)")
        case .error:
            fputs("\u{001B}[0;31mError: \(message)\u{001B}[0;0m\n", stderr)
        }
    }
    

    func getInput() -> String {
        guard let input = readLine() else {
            return "아무 것도 입력하지 않으셨습니다."
        }
        return input.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    func printUsage() {
        let executableName = (CommandLine.arguments[0] as NSString).lastPathComponent
        write("usage:")
        write("\(executableName) -a string1 string2")
        write("or")
        write("\(executableName) -a string")
        write("or")
        write("\(executableName) -h to who usage information")
        write("or")
        write("Type \(executableName) without an option to enter interactive mode")
    }
}

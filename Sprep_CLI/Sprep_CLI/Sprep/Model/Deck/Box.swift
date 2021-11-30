//
//  Box.swift
//  Sprep_CLI
//
//  Created by Bumgeun Song on 2021/11/29.
//

import Foundation

enum Box: TimeInterval {
    case rightNow = 0
    case afterDay = 86400
    case afterWeek = 604800
    case afterMonth = 2592000
    case archive
}

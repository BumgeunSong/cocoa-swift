//
//  Card.swift
//  Sprep_CLI
//
//  Created by Bumgeun Song on 2021/11/29.
//

import Foundation


struct Card {
    var id: UUID
    var box: Double = 86400
    var front: String
    var back: String
    var lastTestTime: Date
    
   
    
    func isDue(date: Date) -> Bool {
        return true
    }
    
    func tested(date: Date, box: Double) {
        
    }
    
}

//
//  BubbleSort.swift
//  week3_practice
//
//  Created by Bumgeun Song on 2021/11/15.
//

import Foundation

class BubbleSort {
    var values: Array<Int>
    
    init(_ values: Array<Int>) {
        self.values = values
    }
    
    func sorted(isAscending: Bool) -> Array<Int> {
        var sortedValues: Array<Int> = values
        var swapped: Bool = true
        
        func swap(aIndex: Int, bIndex: Int) {
            sortedValues.swapAt(aIndex, bIndex)
        }
        
        repeat {
            swapped = false
            for index in 1..<sortedValues.count {
                if isAscending && sortedValues[index-1] > sortedValues[index] {
                    swap(aIndex: index-1, bIndex: index)
                    swapped = true
                }
                if !isAscending && sortedValues[index-1] < sortedValues[index] {
                    swap(aIndex: index-1, bIndex: index)
                    swapped = true
                }
            }
        } while swapped
        
        return sortedValues
    }
}

//
//  Matrix.swift
//  week3_practice
//
//  Created by Bumgeun Song on 2021/11/15.
//

import Foundation

class Matrix {
    var a: Double
    var b: Double
    var c: Double
    var d: Double
    
    init(a: Double = 0, b: Double = 0, c: Double = 0, d: Double = 0) {
        self.a = a
        self.b = b
        self.c = c
        self.d = d
    }
    
    func sum(with other: Matrix) -> Matrix {
        let sumA = self.a + other.a
        let sumB = self.b + other.b
        let sumC = self.c + other.c
        let sumD = self.d + other.d
        return Matrix(a: sumA, b: sumB, c: sumC, d: sumD)
    }
    
    func product(with other: Matrix) -> Matrix {
        let productA = (self.a * other.a) * (self.b * other.c)
        let productB = (self.a * other.b) * (self.b * other.d)
        let productC = (self.c * other.a) * (self.d * other.c)
        let productD = (self.c * other.b) * (self.d * other.d)
        return Matrix(a: productA, b: productB, c: productC, d: productD)
    }
}

extension Matrix: CustomStringConvertible {
    var description: String {
        return "Matrix (\(self.a), \(self.b), \(self.c), \(self.d))"
    }
}

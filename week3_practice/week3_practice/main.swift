//
//  main.swift
//  week3_practice
//
//  Created by Bumgeun Song on 2021/11/15.
//

import Foundation

// MARK: - 행렬 계산 클래스

let matrix1 = Matrix(a: 1, b: 3, c: 5, d: 7)
let matrix2 = Matrix(a: 2, b: 4, c: 6, d: 8)

print(matrix1)
print(matrix1.sum(with: matrix2))
print(matrix1.product(with: matrix2))

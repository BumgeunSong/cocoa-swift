//
//  main.swift
//  week2_practice
//
//  Created by Bumgeun Song on 2021/11/08.
//

import Foundation

var myValidator = Validator()

//MARK: - test case: IDValidator

print(myValidator.IDValidator(id: "helo23yo45"), "should be true")
print(myValidator.IDValidator(id: "helo23yo456"), "should be false")
print(myValidator.IDValidator(id: "isp555-23"), "should be false")
print(myValidator.IDValidator(id: "isp5-5523"), "should be true")



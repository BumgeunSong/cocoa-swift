//
//  main.swift
//  week2_practice
//
//  Created by Bumgeun Song on 2021/11/08.
//

import Foundation

var myValidator = Validator()

//MARK: - test case: IDValidator()

//print(myValidator.IDValidator(id: "helo23yo45"), "should be true")
//print(myValidator.IDValidator(id: "helo23yo456"), "should be false")
//print(myValidator.IDValidator(id: "isp555-23"), "should be false")
//print(myValidator.IDValidator(id: "isp5-5523"), "should be true")

//MARK: - test case: getInterestRate()

var myDepositeManager = DepositManager()
print(myDepositeManager.getInterestRate(byDay: 0))
print(myDepositeManager.getInterestRate(byDay: 90))
print(myDepositeManager.getInterestRate(byDay: 91))
print(myDepositeManager.getInterestRate(byDay: 181))
print(myDepositeManager.getInterestRate(byDay: 365))
print(myDepositeManager.getInterestRate(byDay: -365))

//MARK: - test case: calculateAmount()
print(myDepositeManager.calculateAmount(day: 0, amount: 100))
print(myDepositeManager.calculateAmount(day: 3, amount: 100))
print(myDepositeManager.calculateAmount(day: 181, amount: 100))
print(myDepositeManager.calculateAmount(day: 365, amount: 100))


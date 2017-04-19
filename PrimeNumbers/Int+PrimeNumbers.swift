//
//  Int+Extension.swift
//  PrimeNumbers
//
//  Created by Lennart Wisbar on 19.04.17.
//  Copyright © 2017 Lennart Wisbar. All rights reserved.
//

import Foundation

extension Int {
    var isAPrimeNumber: Bool {
        guard self > 1 else { return false }
        guard self > 3 else { return true }
        
        for divisor in 2...(self/2) {
            if (self % divisor) == 0 {
                return false
            }
        }
        return true
    }
    
    static func primeNumbers(from firstNumber: Int = 1, through lastNumber: Int) -> [Int] {
        var primeNumbers: [Int] = []
        for number in firstNumber...lastNumber {
            if number.isAPrimeNumber {
                primeNumbers.append(number)
            }
        }
        return primeNumbers
    }
}

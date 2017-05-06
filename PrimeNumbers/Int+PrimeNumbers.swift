//
//  Int+PrimeNumbers.swift
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
        guard (self % 2) != 0 else { return false }
        
        var divisor = 3
        let upperBound = Int(sqrt(Double(self)))
        while divisor <= upperBound {
            if (self % divisor) == 0 {
                return false
            }
            divisor += 2
        }
        return true
    }
    
    static func primeNumbers(from firstNumber: Int, through lastNumber: Int) -> [Int] {
        guard lastNumber >= 2 else { return [] } // There are no prime numbers smaller than 2
        var primeNumbers: [Int] = []
        if firstNumber <= 2 { return Int.primeNumbers(through: lastNumber) } // Use optimized function
        for number in firstNumber...lastNumber {
            if number.isAPrimeNumber {
                primeNumbers.append(number)
            }
        }
        return primeNumbers
    }
    
    static func primeNumbers(through lastNumber: Int) -> [Int] {
        guard lastNumber >= 2 else { return [] } // There are no prime numbers smaller than 2
        var primeNumbers = [2]
        
        func isAPrimeNumber(_ number: Int) -> Bool {
            let upperBound = Int(Float(number).squareRoot())
            for divisor in primeNumbers {
                if (number % divisor) == 0 {
                    return false
                }
                if divisor >= upperBound {
                    return true
                }
            }
            return true
        }
        
        var number = 3
        while number <= lastNumber {
            if isAPrimeNumber(number) {
                primeNumbers.append(number)
            }
            number += 2
        }
        return primeNumbers
    }
}

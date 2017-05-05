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
    
//    static func primeNumbersWithOptimizedPerformance(lastNumber: Int) -> [Int] {
//        var primeNumbers: [Int] = [2]
//        
//        for number in 3...lastNumber {
//            if (number % divisor) == 0 {
//                break
//            }
//        }
//        
//        return primeNumbers
//    }

//    static func primeNumbersOptimized(through lastNumber: Int) -> [Int] {
//        var primeNumbers: [Int] = [2]
//        var testNumber = 3
//        var couldBePrime = true
//        var index = 0
//        
//        while testNumber <= lastNumber {
//            while couldBePrime == true {
//                if testNumber % primeNumbers[index] == 0 {
//                    couldBePrime = false
//                    testNumber += 2
//                    index = 0
//                } else {
//                    if primeNumbers[index] >= testNumber / (testNumber+2){ //primeNumbers[index+1]{
//                        //primeNumbers.append(testNumber)
//                        print(testNumber)
//                        testNumber += 2
//                        index = 0
//                    } else {
//                        index += 1
//                    }
//                    couldBePrime = true
//                }
//            }
//        }
//        return primeNumbers
//    }

}

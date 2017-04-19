//
//  main.swift
//  PrimeNumbers
//
//  Created by Lennart Wisbar on 19.04.17.
//  Copyright © 2017 Lennart Wisbar. All rights reserved.
//

import Foundation

func isAPrimeNumber(_ number: Int) -> Bool {
    guard number > 3 else {
        return true
    }
    
    for divisor in 2...(number/2) {
        if (number % divisor) == 0 {
            return false
        }
    }
    return true
}

func primeNumbers(from firstNumber: Int = 1, through lastNumber: Int) -> [Int] {
    var primeNumbers: [Int] = []
    for number in firstNumber...lastNumber {
        if isAPrimeNumber(number) {
            primeNumbers.append(number)
        }
    }
    return primeNumbers
}

print("I will calculate all prime numbers from the first to the last of the two numbers you enter.")
print("Enter first number:")
let firstNumber = Int(readLine()!)!
print("Enter last number:")
let lastNumber = Int(readLine()!)!
let primeNumbersResult = primeNumbers(from: firstNumber, through: lastNumber)
print("\nThese are all prime numbers from \(firstNumber) through \(lastNumber):")
for number in primeNumbersResult {
    print(number)
}

for _ in 1...2 {
    print("=============")
}


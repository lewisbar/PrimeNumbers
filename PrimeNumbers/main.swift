//
//  main.swift
//  PrimeNumbers
//
//  Created by Lennart Wisbar on 19.04.17.
//  Copyright © 2017 Lennart Wisbar. All rights reserved.
//

import Foundation

print("I will calculate all prime numbers from the first through the second number you enter.")
print("Enter first number:")

let firstNumber = Int(readLine()!)!

print("\nEnter last number:")

let lastNumber = Int(readLine()!)!
let primeNumbersResult = Int.primeNumbers(from: firstNumber, through: lastNumber)

print("\nThese are all prime numbers from \(firstNumber) through \(lastNumber):")

for number in primeNumbersResult {
    print(number)
}

for _ in 1...2 {
    print("=============")
}

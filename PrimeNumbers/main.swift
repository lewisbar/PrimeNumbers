//
//  main.swift
//  PrimeNumbers
//
//  Created by Lennart Wisbar on 19.04.17.
//  Copyright © 2017 Lennart Wisbar. All rights reserved.
//

import Foundation

let ending = "\n\n=================================\n\n"
var number = 1
while number > 0 {
    print("Enter a number up to which you want to know all prime numbers (0 to quit):")
    guard let line = readLine(),
        let lastNumber = Int(line),
        lastNumber >= 0 else { print("Invalid input." + ending); continue }
    number = lastNumber
    guard number > 0 else { print("Goodbye!" + ending); continue }
    print("Calculating ...")
    let primeNumbers = Int.primeNumbers(through: number)
    guard let lastPrimeNumber = primeNumbers.last else { print("No result." + ending); continue }
    for number in primeNumbers {
        var terminator = ", "
        if number == lastPrimeNumber {
            terminator = "." + ending
        }
        print(number, terminator: terminator)
    }
}


//print("I will calculate all prime numbers from the first through the second number you enter.")
//print("Enter first number:")
//
//let firstNumber = Int(readLine()!)!
//
//print("\nEnter last number:")
//
//let lastNumber = Int(readLine()!)!
//let primeNumbersResult = Int.primeNumbers(from: firstNumber, through: lastNumber)
//
//print("\nThese are all prime numbers from \(firstNumber) through \(lastNumber):")
//
//for number in primeNumbersResult {
//    print(number)
//}
//
//for _ in 1...2 {
//    print("=============")
//}

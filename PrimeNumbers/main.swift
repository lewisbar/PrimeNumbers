//
//  main.swift
//  PrimeNumbers
//
//  Created by Lennart Wisbar on 19.04.17.
//  Copyright © 2017 Lennart Wisbar. All rights reserved.
//

import Foundation

// MARK: - Reusable Functions
func swap<T>(_ a: inout T, _ b: inout T) {
    let temporaryA = a
    a = b
    b = temporaryA
}

func print<T>(array: [T]) where T: Equatable {
    guard let lastElement = array.last else { return }
    
    for element in array {
        var terminator = ", "
        if element == lastElement {
            terminator = ".\n"
        }
        print(element, terminator: terminator)
    }
}

// MARK: - Specialized Functions
func intro() {
    print("WELCOME TO PRIME NUMBERS")
    print("I will calculate all prime numbers from the first through the second number you enter.\n")
    sleep(1)
}

func getNumber(prompt: String) -> Int {
    while true {
        print(prompt)
        guard let line = readLine(),
            let number = Int(line),
            number >= 0 else { print("Invalid input. Enter a positive integer."); sleep(1); continue }
        return number
    }
}

func ending() {
    print("\n=================================\n")
    sleep(2)
}

func quit() {
    print("\nGoodbye!\n")
    exit(0)
}


// MARK: - Global Scope
while true {
    intro()
    
    var firstNumber = getNumber(prompt: "Enter first number (0 to quit):")
    if firstNumber == 0 { quit() }
    
    var secondNumber = getNumber(prompt: "Enter second number (0 to quit):")
    if secondNumber == 0 { quit() }
    
    if firstNumber > secondNumber {
        print("Swapping numbers ...")
        sleep(1)
        swap(&firstNumber, &secondNumber)
    }
    
    print("\nCalculating ...\n")
    
    let primeNumbers = Int.primeNumbers(from: firstNumber, through: secondNumber)
    
    guard let lastPrimeNumber = primeNumbers.last else { print("No result."); ending(); continue }
    
    print(array: primeNumbers)
    print("These are all prime numbers from \(firstNumber) through \(secondNumber).")
    
    ending()
}

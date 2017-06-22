//: Playground - noun: a place where people can play

import UIKit

func factorial(n: Int) -> Int {
    if n == 0 || n == 1 {
        return 1
    } else {
        return n * factorial(n: n-1)
    }
}

func nonRecFactorial(n: Int) -> Int {
    if n == 0 {
        return 1
    }
    
    var result = 1
    for i in 1...n {
        result *= i
    }
    return result
}

for i in 0...20 {
    let resultRec = factorial(n: i)
    let resultNonRec = nonRecFactorial(n: i)
    print("\(i) --> \(resultRec)  -  \(resultNonRec)")
}


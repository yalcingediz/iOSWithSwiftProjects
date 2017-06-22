//: Playground - noun: a place where people can play

import UIKit

func adder<T: Strideable>(number: T) -> T {
    return number + 1
}

adder(number: 1)
adder(number: 2.0)


protocol Numeric {
    func *(lhs: Self, rhs: Self) -> Self
}

extension Double: Numeric {}
extension Float: Numeric {}
extension Int: Numeric {}

func multiplier<T: Numeric>(lhs: T, rhs: T) -> T {
    return lhs*rhs
}

multiplier(lhs: 4.0, rhs:5)
multiplier(lhs:3, rhs:6)

//: Playground - noun: a place where people can play

import UIKit

class Car {
    static var objectNumber: Int = 0
    var _id: Int
    
    var id: Int {
        get {
            return self._id
        }
        set {
            self._id = newValue
        }
    }
    
    init() {
        Car.objectNumber += 1
        self._id = Car.objectNumber
    }
    
}

var a = Car()
var b = Car()
print("\(a.id)") // logs 1
print("\(b.id)") // logs 2
b.id = 3
print("\(a.id)") // still logs 1
print("\(b.id)")

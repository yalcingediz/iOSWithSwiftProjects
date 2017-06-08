//: Playground - noun: a place where people can play

import UIKit

extension String {
    subscript (i: Int) -> Character {
        return Array(self.characters)[i]
    }
    
    subscript (r: CountableClosedRange<Int>) -> String {
        return String(Array(self.characters)[r])
    }
    
    subscript (r: CountableRange<Int>) -> String {
        return self[r.lowerBound...r.upperBound-1]
    }
}

var testArray = [String]()

var test1 = "Sonos"
print (test1.characters.count)
print(test1[0])

testArray.append(test1)

var test2 = "Sono"
testArray.append(test2)
var test3 = "a"
testArray.append(test3)
var test4 = "ab"
testArray.append(test4)
var test5 = "aa"
testArray.append(test5)
var test6 = "ocawebadanadabewaco"
testArray.append(test6)
testArray.append("AdanadaAdanada")


func isPalindrome(inputStr: String) -> Bool {
    var rtnValue = true
    let length = inputStr.characters.count
    let str = inputStr.lowercased()
    
    if length > 2 {
        var forwardIndex  = 0
        var backwardIndex = 0
        
        
        if (length % 2 == 0) {
            forwardIndex = (length / 2)
            backwardIndex = forwardIndex - 1
        } else {
            backwardIndex = (length / 2) - 1
            forwardIndex = backwardIndex + 2
        }
        print("\(backwardIndex)  \(forwardIndex)")
        repeat {
            if str[backwardIndex] == str[forwardIndex] {
                backwardIndex -= 1
                forwardIndex  += 1
                print("\(backwardIndex)  \(forwardIndex)")
            } else {
                rtnValue = false
            }
            
        } while backwardIndex > 0 && forwardIndex < length && rtnValue == true
        
     } else if length == 1 || (length == 2 && str[0] != str[1]) {
        rtnValue = false
    }
    
    return rtnValue
}


for testStr in testArray {
    let result = isPalindrome(inputStr: testStr)
    print ("\(testStr) is \(result == true ? "a Palindrom" : "not a Palindrom")")
}


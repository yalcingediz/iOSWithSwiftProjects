//
//  Person.swift
//  MVC-Test
//
//  Created by Berkant Y. GEDIZ on 5/23/17,21.
//  Copyright © 2017 Mnemosyne C2. All rights reserved.
//

import Foundation
class Person {
    private var _firstName:String!
    private var _lastName:String!
    
    var firstName:String {
        get {
            return _firstName
        }
        set {
            _firstName = newValue
        }
    }
    
    var lastName:String {
        get {
            return _lastName
        }
        set {
            _lastName = newValue
        }
    }
    
    var fullName:String {
        return "\(firstName) \(lastName)"
    }
    
    
    init(first:String, last:String) {
        _firstName = first
        _lastName = last
    }
    
    
}

//: Playground - noun: a place where people can play

import UIKit


protocol Vehicle: CustomStringConvertible {
    var isRunning:Bool {get set}
    var make:String {get set}
    var model:String {get set}
    
    mutating func start()
    mutating func turnOff()
}

extension Vehicle {
    
    var makeModel:String {
        return "\(make) \(model)"
    }
    mutating func start() {
        if isRunning {
            print("Already started!")
        } else {
            isRunning = true
            print("\(self.description) fired up!")
        }
    }
    
    mutating func turnOff() {
        if isRunning {
            isRunning = false
            print("\(self.description) shut down!")
        } else {
            print("Already dead!")
        }
        
    }
}

struct SportsCar: Vehicle {
    var isRunning:Bool = false
    var make: String
    var model: String
    
    var description: String {
        return self.makeModel
    }
}

class SemiTruck: Vehicle {
    var isRunning:Bool = false
    var make:String
    var model:String
    
    init(isRunning:Bool, make:String, model:String) {
        self.isRunning = isRunning
        self.make = make
        self.model = model
    }
    
    var description: String {
        return self.makeModel
    }
    
    func blowAirHorn() {
        print("TOOOT")
    }
}

var car1 = SportsCar(isRunning: false, make: "Porche", model: "911")
var truck1 = SemiTruck(isRunning: false, make: "Ford", model: "F250")

car1.start()
truck1.start()
truck1.blowAirHorn()

car1.turnOff()
truck1.turnOff()

var vehicleArray: [Vehicle] = [car1, truck1]

for v in vehicleArray {
    print("\(v.makeModel)")
}

extension Double {
    var dollarString:String {
        return String(format: "$%.2f", self)
    }
}

let myMoney = 50.052
print ("\(myMoney)")




//
//  Location.swift
//  RainyShinyCloudy
//
//  Created by Berkant Y. GEDIZ on 5/31/17,22.
//  Copyright © 2017 Mnemosyne C2. All rights reserved.
//

import CoreLocation

class Location {
    static var sharedInstance = Location()
    
    private init() {}
    
    var latitude: Double!
    var longitude: Double!
    
    func description() -> String {
        return "CurrentLocation: latitude: \(self.latitude) Longitude: \(self.longitude)"
    }
}

//
//  TempConverter.swift
//  RainyShinyCloudy
//
//  Created by Berkant Y. GEDIZ on 5/27/17,21.
//  Copyright © 2017 Mnemosyne C2. All rights reserved.
//

import UIKit
class TempConverter {
    static let  TEMP_CALVIN_TO_FAHRENIT_CONSTANT = 459.67
    
    static func calvinToFahrenit(tempInCalvin: Double) -> Double {
        let rawFahrenitTemp = tempInCalvin * (9/5) - self.TEMP_CALVIN_TO_FAHRENIT_CONSTANT  // convert from Calvin to Fahrenit
        return round(10 * rawFahrenitTemp / 10)
    }
    
    static func convertAndFormatDate(timeSinceEpoch: Double) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .none
        let date = dateFormatter.string(from: Date(timeIntervalSince1970: timeSinceEpoch))
        return date
    }
    
    static func DayOfWeekForADate(timeSinceEpoch: Double) -> String {
        let date = Date(timeIntervalSince1970: TimeInterval(timeSinceEpoch))
        let calendar = Calendar.current
        let day = calendar.component(.weekday, from: date)
        return self.getDayOfWeek(day: day)
    }
    
    static func getDayOfWeek(day: Int) -> String {
        switch day {
        case 1: return "Sunday"
        case 2: return "Monday"
        case 3: return "Tuesday"
        case 4: return "Wednesday"
        case 5: return "Thursday"
        case 6: return "Friday"
        case 7: return "Saturday"
        default: return ""
        }
    }
}

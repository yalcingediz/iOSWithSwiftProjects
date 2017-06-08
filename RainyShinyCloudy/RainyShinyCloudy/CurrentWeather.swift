//
//  CurrentWeather.swift
//  RainyShinyCloudy
//
//  Created by Berkant Y. GEDIZ on 5/25/17,21.
//  Copyright © 2017 Mnemosyne C2. All rights reserved.
//

import UIKit
import Alamofire
import CoreLocation

class CurrentWeather {
    private var _cityName: String!
    private var _date: String!
    private var _weatherType: String!
    private var _currentTemp: Double!
    
    private var _className = String(describing: CurrentWeather.self)
    
    var cityName: String {
        get {
            if _cityName == nil {
                _cityName = ""
            }
            return _cityName
        }
        set {
            _cityName = newValue
        }
    }
    
    var date:String {
        get {
            if _date == nil {
                _date = ""
            }
            self._date = "Today, \(TempConverter.convertAndFormatDate(timeSinceEpoch: Date().timeIntervalSince1970))"
            
            return _date
        }
    }
    
    var weatherType: String {
        get {
            if _weatherType == nil {
                _weatherType = ""
            }
            return _weatherType
        }
        set {
            _weatherType = newValue
        }
    }
    
    var currentTemp: Double {
        get {
            if _currentTemp == nil {
                _currentTemp = 0.00
            }
            return _currentTemp
        }
        set {
            _currentTemp = currentTemp
        }
    }
   
    func downloadWeatherDetails(completed: DownloadComplete) {
        let descriptionNameHelp:String = self._className + ":downloadWeatherDetails:"
        //Aloma download
        let currentWeatherURL = URL(string: CURRENT_WEATHER_URL)
        
        Alamofire.request(currentWeatherURL!).responseJSON { response in
            let result = response.result
            print("\(descriptionNameHelp) HTTP Request Result: \(result)")
            //print(response)
            if let dict = result.value as? Dictionary<String, AnyObject> {
                if let name = dict["name"] as? String {
                    self._cityName = name.capitalized
                    print("\(descriptionNameHelp) self.cityName = \(self.cityName)")
                }
                if let weatherInfoDict = dict["weather"] as? [Dictionary<String, AnyObject>] {
                    if let wt = weatherInfoDict[0]["main"] as? String {
                        self._weatherType = wt.capitalized
                        print("\(descriptionNameHelp) self.weatherType = \(self.weatherType)")
                    }
                }
                if let main = dict["main"] as? Dictionary<String, AnyObject> {
                    if let temp = main["temp"] as? Double {
                        self._currentTemp = TempConverter.calvinToFahrenit(tempInCalvin: temp)  // convert from Calvin to Fahrenit
                        self._currentTemp = Double(round(10 * self._currentTemp / 10))
                        print("\(descriptionNameHelp) self.currentTemp = \(self.currentTemp)")
                    }
                }
            }
            else {
                print("\(descriptionNameHelp) ERROR: cannot cast HTTP response to Dictionary<String, AnyObject> !")
            }
        }
        completed()
    }

}

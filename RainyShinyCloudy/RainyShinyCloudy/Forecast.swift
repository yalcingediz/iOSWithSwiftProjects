//
//  Forecast.swift
//  RainyShinyCloudy
//
//  Created by Berkant Y. GEDIZ on 5/27/17,21.
//  Copyright © 2017 Mnemosyne C2. All rights reserved.
//

import UIKit
import Alamofire

class Forecast {
    
    struct SingleDayForecast {
        private var _date:String!
        private var _weatherType:String!
        private var _highTemp:Double!
        private var _lowTemp:Double!
        private var _dateInEpochTime:Double!
        private var _dayOfWeek:String!
        
        
        var date:String {
            mutating get {
                if self._date == nil {
                    self._date = ""
                }
                self._date = TempConverter.convertAndFormatDate(timeSinceEpoch: self._dateInEpochTime)
                return self._date
            }
            set {
                self._date = newValue
            }
        }
        
        var dateInEpochTime:Double {
            mutating get {
                if self._dateInEpochTime == nil {
                    self._dateInEpochTime = 0
                }
                return self._dateInEpochTime
            }
            set {
                self._dateInEpochTime = newValue
            }

        }
        
        var dayOfWeek:String {
            mutating get {
                if self._dayOfWeek == nil {
                    self._dayOfWeek = ""
                }
                return  self._dayOfWeek
            }
            set {
                 self._dayOfWeek = newValue
            }
          }
    
        var weatherType:String {
            mutating get {
                if  self._weatherType == nil {
                    self._weatherType = ""
                }
                return _weatherType
            }
            set {
                 self._weatherType = newValue
            }
        }
        
        var highTemp:Double {
            mutating get {
                if  self._highTemp == nil {
                     self._highTemp = 0.0
                }
                return self._highTemp
            }
            set {
                 self._highTemp = newValue
            }
        }
        
        var lowTemp:Double {
            mutating get {
                if  self._lowTemp == nil {
                     self._lowTemp = 0.0
                }
                return  self._lowTemp
            }
            set {
                 self._lowTemp = newValue
            }
        }
        
        init(weatherDict: Dictionary<String, AnyObject>) {
            if let date = weatherDict["dt"] as? Double {
                self._dateInEpochTime = date
                self._dayOfWeek = TempConverter.DayOfWeekForADate(timeSinceEpoch: date)
                self._date = TempConverter.convertAndFormatDate(timeSinceEpoch: self._dateInEpochTime)
                //print("dateConverted: \(tempDate) - \(day) - \(dayOfWeek)")
                
                
            }
            if let temp = weatherDict["temp"] as? Dictionary<String, Double> {
                if let min = temp["min"] {
                    self._lowTemp = TempConverter.calvinToFahrenit(tempInCalvin: min)
                }
                if let max = temp["max"] {
                    self._highTemp = TempConverter.calvinToFahrenit(tempInCalvin: max)
                }

            }
            if let weatherInfo = weatherDict["weather"] as? [Dictionary<String, AnyObject>]  {
                if let wt = weatherInfo[0]["main"] as? String {
                    self._weatherType = wt
                }
            }
            
        }
        
        func description() -> String {
            return "\(self._dateInEpochTime!) \(self._date!) \(self._dayOfWeek!) \(self._weatherType!) \(self._highTemp!) \(self._lowTemp!)"
        }

    } // END- SingleDayForecast
    
    private var _className = String(describing: Forecast.self)
    var forecastList = [SingleDayForecast]()
    
    func downloadForecastDetails(completed: DownloadComplete) {
        let descriptionNameHelp:String = self._className + ":downloadForecastDetails:"
        //Aloma download
        let forecastURL = URL(string: FORECAST_URL)
        
        Alamofire.request(forecastURL!).responseJSON { response in
            let result = response.result
            
            print("\(descriptionNameHelp) HTTP Request Result: \(result)")
            print(response)
            if let dict = result.value as? Dictionary<String, AnyObject> {
                if let list = dict["list"] as? [Dictionary<String, AnyObject>] {
                    
                    for obj in list {
                        let forecast = SingleDayForecast(weatherDict: obj)
                        //print(forecast.description())
                        self.forecastList.append(forecast)
                    }
                    self.forecastList.remove(at: 0) //today's forecast
                    self.printForecastList()
                }
            }            
            else {
                print("\(descriptionNameHelp) ERROR: cannot cast HTTP response to Dictionary<String, AnyObject> !")
            }
        }
        completed()
    }
    
    func printForecastList() {
        print("\(self._className):printForecastList: BEGIN")
        for forecast in forecastList {
            print("\t\(forecast.description())")
        }
        print("\(self._className):printForecastList: END")
    }
    
    


}

//
//  Constants.swift
//  RainyShinyCloudy
//
//  Created by Berkant Y. GEDIZ on 5/25/17,21.
//  Copyright © 2017 Mnemosyne C2. All rights reserved.
//

import Foundation

let BASE_URL = "http://api.openweathermap.org/data/2.5/"
let WEATHER = "weather?"
let FORECAST = "forecast/daily?"
let LATITUDE = "lat=36.975228"
let LONGTITUDE = "&lon=-121.953293"
let APP_ID = "&appid="
let APP_KEY = "2a21f482f6d05b7b1f9b4b2b4da57c52"
let LANGUAGE = "&lang=en-US"

typealias DownloadComplete = (() -> Void)!

//let CURRENT_WEATHER_URL = "\(BASE_URL)\(WEATHER)\(LATITUDE)\(LONGTITUDE)\(APP_ID)\(APP_KEY)\(LANGUAGE)"
//let FORECAST_URL = "\(BASE_URL)\(FORECAST)\(LATITUDE)\(LONGTITUDE)\(APP_ID)\(APP_KEY)\(LANGUAGE)"
let CURRENT_WEATHER_URL = "\(BASE_URL)\(WEATHER)lat=\(Location.sharedInstance.latitude!)&lon=\(Location.sharedInstance.longitude!)\(APP_ID)\(APP_KEY)\(LANGUAGE)"
let FORECAST_URL = "\(BASE_URL)\(FORECAST)lat=\(Location.sharedInstance.latitude!)&lon=\(Location.sharedInstance.longitude!)\(APP_ID)\(APP_KEY)\(LANGUAGE)"



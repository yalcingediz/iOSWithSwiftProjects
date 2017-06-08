//
//  WeatherVC.swift
//  RainyShinyCloudy
//
//  Created by Berkant Y. GEDIZ on 5/25/17,21.
//  Copyright © 2017 Mnemosyne C2. All rights reserved.
//

import UIKit
import Alamofire
import CoreLocation

class WeatherVC: UIViewController, UITableViewDelegate, UITableViewDataSource, CLLocationManagerDelegate {
    @IBOutlet weak var todaysDateLabel: UILabel!
    @IBOutlet weak var currentTempLabel: UILabel!
    @IBOutlet weak var currentLocationLabel: UILabel!
    @IBOutlet weak var currentWeatherImage: UIImageView!
    @IBOutlet weak var currentWeatherDescriptionLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    let locationManager = CLLocationManager()
    var currentLocation: CLLocation!
    
    var currentWeather = CurrentWeather()
    var forecast = Forecast()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startMonitoringSignificantLocationChanges()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.locationAuthStatus()
    }
 
    
    func locationAuthStatus() {
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse {
            currentLocation = locationManager.location
            Location.sharedInstance.latitude = currentLocation.coordinate.latitude
            Location.sharedInstance.longitude = currentLocation.coordinate.longitude
            
            tableView.delegate = self
            tableView.dataSource = self

            print("CURRENT_WEATHER_URL: \(CURRENT_WEATHER_URL)")
            print("FORECAST_URL: \(FORECAST_URL)")
            
            currentWeather.downloadWeatherDetails {
                print("WeatherVC:locationAuthStatus:currentWeather.downloadWeatherDetails: BEGIN")
                self.forecast.downloadForecastDetails {
                    self.updateMainUI()
                }
                print("WeatherVC:locationAuthStatus:currentWeather.downloadWeatherDetails: END")
            }
            
            
            //print(Location.sharedInstance.description())
            
        } else {
            locationManager.requestWhenInUseAuthorization()
            locationAuthStatus()
        }
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return forecast.forecastList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "weatherCell", for: indexPath) as? WeatherCell {
            var singleDayForecast = forecast.forecastList[indexPath.row]
            cell.configureCell(forecast: &singleDayForecast)
            return cell
        } else {
            return WeatherCell()
        }
    }
    
    func updateMainUI() {
        print("WeatherVC:updateMainUI: BEGIN")
        todaysDateLabel.text = currentWeather.date
        currentTempLabel.text = "\(currentWeather.currentTemp)"
        print("WeatherVC:updateUI: \(String(describing: currentTempLabel.text!))")
        currentLocationLabel.text = currentWeather.cityName
        currentWeatherDescriptionLabel.text = currentWeather.weatherType
        currentWeatherImage.image = UIImage(named: currentWeather.weatherType)
      //  self.tableView.reloadData()
        print("WeatherVC:updateUI: END")

    }
}


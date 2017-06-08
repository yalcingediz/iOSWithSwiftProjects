//
//  WeatherCell.swift
//  RainyShinyCloudy
//
//  Created by Berkant Y. GEDIZ on 5/30/17,22.
//  Copyright © 2017 Mnemosyne C2. All rights reserved.
//

import UIKit

class WeatherCell: UITableViewCell {
    @IBOutlet weak var weatherImageView:UIImageView!
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var weatherTypeLabel: UILabel!
    @IBOutlet weak var highTempLabel: UILabel!
    @IBOutlet weak var lowTempLabel: UILabel!

    func configureCell( forecast: inout Forecast.SingleDayForecast) {
        dayLabel.text = forecast.dayOfWeek
        weatherTypeLabel.text = forecast.weatherType
        
        highTempLabel.text = "\(forecast.highTemp)"
        lowTempLabel.text = "\(forecast.lowTemp)"
        weatherImageView.image = UIImage(imageLiteralResourceName: forecast.weatherType)
    }

}

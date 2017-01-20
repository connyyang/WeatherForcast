//
//  Weather.swift
//  WeatherForcast
//
//  Created by Conny Yang on 19/01/2017.
//  Copyright © 2017 Conny Yang. All rights reserved.
//

import Foundation

class Weather
{
    let latitude : Double
    let longitude : Double
    var currently : CurrentWeather?
    var hourly : HourlyWeather?
    var daily : DailyWeather?
    
    init(json : [String : Any])
    {
        self.latitude = json["latitude"] as! Double
        self.longitude = json["longitude"] as! Double
        
        if let currentlyJSON = json["currently"] as? [String : Any]
        {
            currently = CurrentWeather(json: currentlyJSON)
        }
        
        if let hourlyJSON = json["hourly"] as? [String : Any]
        {
            hourly = HourlyWeather(json: hourlyJSON)
        }

        if let dailyJSON = json["daily"] as? [String : Any]
        {
            daily = DailyWeather(json: dailyJSON)
        }

    }
}

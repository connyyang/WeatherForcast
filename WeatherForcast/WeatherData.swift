//
//  weatherData.swift
//  WeatherForcast
//
//  Created by Conny Yang on 18/01/2017.
//  Copyright © 2017 Conny Yang. All rights reserved.
//

import Foundation

class WeatherData
{
    var time: Int32
    var temperature : Double?
    var humidity : Double?
    var windSpeed : Double?
    
    init?(time: Int32, temperature : Double?, humidity: Double?, windSpeed: Double?)
    {
        self.time = time
        if let temperature = temperature
        {
            self.temperature = temperature
        }
        
        if let humidity = humidity
        {
            self.humidity = humidity
        }
        
        if let windSpeed = windSpeed
        {
            self.windSpeed = windSpeed
        }
    }
}

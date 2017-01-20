//
//  CurrentWeather.swift
//  WeatherForcast
//
//  Created by Conny Yang on 18/01/2017.
//  Copyright © 2017 Conny Yang. All rights reserved.
//

import Foundation

class CurrentWeather : WeatherData
{
    var summary : String
    var icon : String
    
    init?(json : [String : Any])
    {
        
        self.summary = json["summary"] as! String
        self.icon = json["icon"] as! String
        
        super.init(time: json["time"] as! Int32, temperature: json["temperature"] as? Double, humidity: json["humidity"] as? Double, windSpeed: json["windSpeed"] as? Double)
    }
}

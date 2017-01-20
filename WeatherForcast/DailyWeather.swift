//
//  DailyWeather.swift
//  WeatherForcast
//
//  Created by Conny Yang on 19/01/2017.
//  Copyright © 2017 Conny Yang. All rights reserved.
//

import Foundation

class DailyWeather
{
    let summary : String
    let icon : String
    
    var weatherDatas : [WeatherData]?
    
    init?(json: [String : Any])
    {
        self.summary = json["summary"] as! String
        self.icon = json["icon"] as! String
        
        if let dataArray = json["data"] as? [[String : Any]]
        {
            for data in dataArray
            {
                let weatherData = WeatherData(time: data["time"] as! Int32, temperature: data["temperature"] as? Double, humidity: data["humidity"] as? Double, windSpeed: data["windSpeed"] as? Double)
                
                weatherDatas?.append(weatherData!)
            }
        }
    }
}

//
//  Coordinate.swift
//  WeatherForcast
//
//  Created by Conny Yang on 18/01/2017.
//  Copyright © 2017 Conny Yang. All rights reserved.
//

import Foundation

struct Coordinate : CustomStringConvertible
{
    let latitude : Double
    let longitude : Double
    
    var description: String{
        return "\(latitude),\(longitude)"
    }
    
    init?(latitude : Double, longitude: Double)
    {
        self.latitude = latitude
        self.longitude = longitude
    }
}

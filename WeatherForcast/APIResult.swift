//
//  APIResult.swift
//  WeatherForcast
//
//  Created by Conny Yang on 19/01/2017.
//  Copyright © 2017 Conny Yang. All rights reserved.
//

import Foundation

enum APIResult<T>
{
    case success(T)
    case failure(Error)
}

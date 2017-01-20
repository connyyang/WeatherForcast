//
//  WeatherClient.swift
//  WeatherForcast
//
//  Created by Conny Yang on 19/01/2017.
//  Copyright © 2017 Conny Yang. All rights reserved.
//

import Foundation

class WeatherClient
{
    var baseURL : String = "https://api.darksky.net"
    var path : String = "/forecast/"
    
    var requestURL : URLRequest

    var coordinate : Coordinate = Coordinate(latitude: 42.3601, longitude: -71.0589)!
    
    
    init(APIKey : String)
    {
        let url = "\(baseURL)\(path)\(APIKey)/\(coordinate.description)"
        self.requestURL = URLRequest(url: URL(string: url)!)
    }
    
    func fetchWeatherFor(completion: @escaping ((APIResult<Weather>) -> Void))
    {
        let networkProcessing = NetworkProcessing(request: requestURL)
        networkProcessing.downloadJSON { (json, response, error) in
            DispatchQueue.main.async {
                //print("json result:")
               //print(json)
                guard let json = json else
                {
                    if let error = error
                    {
                        completion(.failure(error))
                        
                    }
                    return
                }
                
                let weather = Weather(json: json)
                completion(.success(weather))
                return
            }
        }
    }
   
}

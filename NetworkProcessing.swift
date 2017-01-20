//
//  NetworkProcessing.swift
//  WeatherForcast
//
//  Created by Conny Yang on 18/01/2017.
//  Copyright © 2017 Conny Yang. All rights reserved.
//

import Foundation

public let NetworkProcessingDomainName = "\(Bundle.main.bundleIdentifier!).NetworkingError"
public let MissingHttpResponseCode = 10

class NetworkProcessing
{
    let urlRequest : URLRequest
    
    lazy var configuration : URLSessionConfiguration = URLSessionConfiguration.default
    
    lazy var session : URLSession = URLSession(configuration: self.configuration)
    
    typealias JSON = [String : Any]
    typealias JSONHandler = (JSON?, HTTPURLResponse?, Error?) -> Void
    
    init(request: URLRequest)
    {
        self.urlRequest = request
    }
    
    func downloadJSON(completion: @escaping JSONHandler)
    {
        
        let dataTask = session.dataTask(with: urlRequest) { (data, response, error) in
            guard let httpResponse = response as? HTTPURLResponse else
            {
                let userInfo = [NSLocalizedDescriptionKey : NSLocalizedString("Missing Http Response", comment: "")]
                
                let error = NSError(domain: NetworkProcessingDomainName, code: MissingHttpResponseCode, userInfo: userInfo)
                
                completion(nil, nil, error as Error)
                return
            }
            
            if data == nil
            {
                if let error = error
                {
                    completion(nil, httpResponse, error)
                }
            }
            else
            {
               switch httpResponse.statusCode
               {
                // Response is OK
                case 200:
                    do{
                        let json = try JSONSerialization.jsonObject(with: data!, options: []) as! [String : Any]
                        completion(json, httpResponse, nil)
                    }catch {
                        completion(nil, httpResponse, error as Error)
                    }
                
               default:
                    //print(error?.localizedDescription)
                    print("Http Response Code : \(httpResponse.statusCode)")
               }
            }
        }
        
        dataTask.resume()
    }
}

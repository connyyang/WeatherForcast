//
//  ViewController.swift
//  WeatherForcast
//
//  Created by Conny Yang on 18/01/2017.
//  Copyright © 2017 Conny Yang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let weatherClient = WeatherClient(APIKey: "33c371344898311931ea3058dcc4730f")
        weatherClient.fetchWeatherFor { result in
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


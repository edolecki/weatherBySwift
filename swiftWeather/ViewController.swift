//
//  ViewController.swift
//  swiftWeather
//
//  Created by Eric Dolecki on 7/8/14.
//  Copyright (c) 2014 Eric Dolecki. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    @IBOutlet var myLabel: UILabel = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Types not inferred, but cleaner doing so.
        let weather: WeatherRetriever = WeatherRetriever()
        var conditions: Weather = weather.getWeather("01701")
        var myInt:Int = Int(conditions.temperature)
        var myHumidity: Int = conditions.humidity
        var myHighTemp: Float = conditions.temp_max
        var myLowTemp: Float = conditions.temp_min
        var myString: String = "Currently \(myInt)ºF, \(conditions.city), \(conditions.description)"
        myLabel.text = myString
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}


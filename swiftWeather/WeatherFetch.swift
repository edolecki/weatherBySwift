//
//  WeatherFetch.swift
//  swiftWeather
//
//  Created by Eric Dolecki on 7/8/14.
//  Copyright (c) 2014 Eric Dolecki. All rights reserved.
//

import Foundation

class WeatherRetriever {
    func getWeather(zipCode: String) -> Weather {
        let url: String = "http://api.openweathermap.org/data/2.5/weather?q=\(zipCode)&units=imperial"
        let request: NSURLRequest = NSURLRequest(URL: NSURL(string: url))
        var response: AutoreleasingUnsafePointer<NSURLResponse?> = nil
        var error: NSErrorPointer!
        let data = NSURLConnection.sendSynchronousRequest(request, returningResponse: response, error: error)
        let result = NSJSONSerialization.JSONObjectWithData(data, options: nil, error: nil) as NSDictionary
        let city = result["name"] as String
        let description = ((result["weather"] as NSArray)[0] as NSDictionary)["description"] as String
        let temperature = (result["main"] as NSDictionary)["temp"] as Float
        let humidity = (result["main"] as NSDictionary)["humidity"] as Int
        let temp_min = (result["main"] as NSDictionary)["temp_min"] as Float
        let temp_max = (result["main"] as NSDictionary)["temp_max"] as Float
        return Weather(temperature: temperature, description: description,
                        city:city, humidity:humidity, temp_min:temp_min,
                        temp_max:temp_max
        )
    }
}
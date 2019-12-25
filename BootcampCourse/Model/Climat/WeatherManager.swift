//
//  WeatherManager.swift
//  BootcampCourse
//
//  Created by yauheni prakapenka on 25.12.2019.
//  Copyright © 2019 yauheni prakapenka. All rights reserved.
//

import Foundation

struct WeatherManager {
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=aae36a3b16c74e4080309f1686872f92&units=metric"
    
    func fetchWeather(cityName: String) {
        let urlString = "\(weatherURL)&q=\(cityName)"
        performRequest(urlString: urlString)
    }
    
    func performRequest(urlString: String) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print(error!)
                    return
                }
                
                if let safeData = data {
                    self.parseJSON(weatherData: safeData)
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(weatherData: Data) {
        let decoder = JSONDecoder()
        do {
            let decodeData = try decoder.decode(WeatherData.self, from: weatherData)
            print(decodeData.name)
            print(decodeData.main.temp)
            print(decodeData.weather[0].description)
        } catch {
            print(error)
        }
    }
}

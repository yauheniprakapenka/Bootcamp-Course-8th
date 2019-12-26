//
//  WeatherManager.swift
//  BootcampCourse
//
//  Created by yauheni prakapenka on 25.12.2019.
//  Copyright © 2019 yauheni prakapenka. All rights reserved.
//

import Foundation

protocol WeatherManagerDelegate {
    func didUpdateWeather(weather: WeatherModel)
    func didFailWithError(error: Error)
}

struct WeatherManager {
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=aae36a3b16c74e4080309f1686872f92&units=metric"
    
    var delegate: WeatherManagerDelegate?
    
    func fetchWeatherWithCity(city: String) {
        let urlString = "\(weatherURL)&q=\(city)"
        print(urlString)
        performRequest(urlString: urlString)
    }
    
    func fetchWeatherWithCoordinate(lat: String, lon: String) {
        let urlString = "\(weatherURL)&lat=\(lat)&lon=\(lon)"
        print(urlString)
        performRequest(urlString: urlString)
    }
    
    func performRequest(urlString: String) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    self.delegate?.didFailWithError(error: error!)
                    print(error!)
                    return
                }
                
                if let safeData = data {
                    if let weather = self.parseJSON(weatherData: safeData) {
                        self.delegate?.didUpdateWeather(weather: weather)
                    }
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(weatherData: Data) -> WeatherModel? {
        let decoder = JSONDecoder()
        do {
            let decodeData = try decoder.decode(WeatherData.self, from: weatherData)
            
            let conditionId = decodeData.weather[0].id
            let cityName = decodeData.name
            let temperature = decodeData.main.temp
            
            let weather = WeatherModel(conditionId: conditionId, cityName: cityName, temperature: temperature)
            print(weather)
            
            return weather
        } catch {
            delegate?.didFailWithError(error: error)
            print(error)
            return nil
        }
    }
}

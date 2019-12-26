//
//  WeatherModel.swift
//  BootcampCourse
//
//  Created by yauheni prakapenka on 25.12.2019.
//  Copyright © 2019 yauheni prakapenka. All rights reserved.
//

import Foundation

struct WeatherModel {
    let conditionId: Int
    let cityName: String
    let temperature: Double
    
    var temperatureString: String {
        return String(format: "%.1f", temperature)
    }
    
    var conditionName: String {
        switch conditionId {
        case 200...232:
            return "tornado"
        case 300...321:
            return "cloud.drizzle"
        case 500...531:
            return "cloud.heavyrain"
        case 600...622:
            return "snow"
        case 701...781:
            return "tropicalstorm"
        case 800:
            return "sun.min"
        case 801...804:
            return "cloud"
        default:
            return "questionmark.circle"
        }
    }
}

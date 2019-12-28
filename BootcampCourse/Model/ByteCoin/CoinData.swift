//
//  CoinData.swift
//  BootcampCourse
//
//  Created by yauheni prakapenka on 27.12.2019.
//  Copyright © 2019 yauheni prakapenka. All rights reserved.
//

import Foundation

struct CoinData: Decodable {
    let ask: Double
    let display_symbol: String
    let averages: Averages
    let display_timestamp: String
}

struct Averages: Decodable {
    let day: Double
    let week: Double
    let month: Double
}

//
//  CoinManager.swift
//  BootcampCourse
//
//  Created by yauheni prakapenka on 27.12.2019.
//  Copyright © 2019 yauheni prakapenka. All rights reserved.
//

import Foundation

protocol CoinManagerDelegate {
    func didUpdateCoin(coinModel: CoinModel)
    func didFailWithError(error: Error)
}

struct CoinManager {
    let baseURL = "https://apiv2.bitcoinaverage.com/indices/global/ticker/BTC"
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    
    var delegate: CoinManagerDelegate?
    
    func getByteCoinPrice(urlString: String) {
        if let url = URL(string: "\(baseURL)\(urlString)") {
            print(url)
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    self.delegate?.didFailWithError(error: error!)
                    print(error!)
                    return
                }
                
                if let safeData = data {
                    if let coin = self.parseJSON(coinData: safeData) {
                        self.delegate?.didUpdateCoin(coinModel: coin)
                    }
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(coinData: Data) -> CoinModel? {
        let decoder = JSONDecoder()
        do {
            let decodeData = try decoder.decode(CoinData.self, from: coinData)
            
            let ask = decodeData.ask
            let displaySymbol = decodeData.display_symbol
            let averageDay = decodeData.averages.day
            let averageWeek = decodeData.averages.week
            let averageMonth = decodeData.averages.month
            let time = decodeData.display_timestamp
            
            let coinModel = CoinModel(ask: ask, displaySymbol: displaySymbol, averageDay: averageDay, averageWeek: averageWeek, averageMonth: averageMonth, displayTimestamp: time)
            print(coinModel)
            return coinModel
        } catch {
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
}

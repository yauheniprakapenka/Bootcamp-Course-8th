//
//  CoinManager.swift
//  BootcampCourse
//
//  Created by yauheni prakapenka on 27.12.2019.
//  Copyright © 2019 yauheni prakapenka. All rights reserved.
//

import Foundation

protocol CoinManagerDelegate {
    func didUpdateCoin(coin: CoinModel)
    func didFailWithError(error: Error)
}

struct CoinManager {
    let baseURL = "https://apiv2.bitcoinaverage.com/indices/global/ticker/BTC"
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    
    var delegate: CoinManagerDelegate?
    
    func getCoinPrice(for currency: String) {
        let urlString = "\(baseURL)\(currency)"
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
                    if let coin = self.parseJSON(coinData: safeData) {
                        self.delegate?.didUpdateCoin(coin: coin)
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
            let coin = CoinModel(ask: ask, displaySymbol: displaySymbol)
            print(coin)
            return coin
        } catch {
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
}

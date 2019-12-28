//
//  CoinViewController.swift
//  BootcampCourse
//
//  Created by yauheni prakapenka on 27.12.2019.
//  Copyright © 2019 yauheni prakapenka. All rights reserved.
//

import UIKit

class CoinViewController: UIViewController {
    
    @IBOutlet weak var currencyLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var currencyPicker: UIPickerView!
    @IBOutlet weak var padView: UIView!
    
    @IBOutlet weak var averageDayLabel: UILabel!
    @IBOutlet weak var averageWeekLabel: UILabel!
    @IBOutlet weak var averageMonthLabel: UILabel!
    
    @IBOutlet weak var timeLabel: UILabel!
    
    var coinManager = CoinManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        coinManager.delegate = self
        
        currencyPicker.dataSource = self
        currencyPicker.delegate = self
        
        padView.layer.cornerRadius = padView.frame.size.height / 2
        
        coinManager.getByteCoinPrice(urlString: "RUB")
    }
}

//MARK: - UIPickerViewDataSource, UIPickerViewDelegate

extension CoinViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return coinManager.currencyArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return coinManager.currencyArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let currentCurrency = coinManager.currencyArray[row]
        coinManager.getByteCoinPrice(urlString: currentCurrency)
    }
}

//MARK: - CoinManagerDelegate

extension CoinViewController: CoinManagerDelegate {
    func didUpdateCoin(coinModel: CoinModel) {
        DispatchQueue.main.async {
            self.valueLabel.text = String(coinModel.ask)
            self.currencyLabel.text = coinModel.displaySymbol
            self.averageDayLabel.text = String(coinModel.averageDay)
            self.averageWeekLabel.text = String(coinModel.averageWeek)
            self.averageMonthLabel.text = String(coinModel.averageMonth)
            self.timeLabel.text = String(coinModel.displayTimestamp)
        }
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
}


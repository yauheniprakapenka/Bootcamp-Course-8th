//
//  TipsyBrain.swift
//  BootcampCourse
//
//  Created by yauheni prakapenka on 23.12.2019.
//  Copyright © 2019 yauheni prakapenka. All rights reserved.
//

import Foundation

struct TipsyBrain {
    
    var tipsyModel: TipsyModel?
    
    mutating func getBillForOnePerson(totalBill: String, percent: String, numberOfPerson: String) -> String {
        let totalBill = Double(totalBill)
        let splitNumber = Double(numberOfPerson)
        let percent = Double(percent)
        
        let billForOnePerson = Double(totalBill! / splitNumber!)
        let tip = billForOnePerson * (percent! / 100)
        let totalForOnePerson = billForOnePerson + tip
        
        tipsyModel = TipsyModel(totalBillForOnePerson: String(billForOnePerson), numberOfPerson: Int(splitNumber!), tipPersentage: Int(percent!))
        
        return String(format: "%.2f", totalForOnePerson)
    }
    
    func getNumberOfPerson() -> Int {
        return tipsyModel!.numberOfPerson
    }
    
    func getTipPersentage() -> Int {
        return tipsyModel!.tipPersentage
    }
}

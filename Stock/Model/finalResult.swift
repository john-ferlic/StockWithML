//
//  finalResult.swift
//  Stock
//
//  Created by John Ferlic on 1/21/20.
//  Copyright © 2020 ctsuser. All rights reserved.
//

import Foundation

class finalResult: Codable {
    var beginningAmountOfMoney: String
    var totMoneyToEnd: String
    var percentageChange: String
    var spyOpen: String
    var spyClose: String
    var spyPercentageChange: String
    
    init() {
        beginningAmountOfMoney = "N/A"
        totMoneyToEnd = "N/A"
        percentageChange = "N/A"
        spyOpen = "N/A"
        spyClose = "N/A"
        spyPercentageChange = "N/A"
    }
    
    init(timeSold: String, name: String, ticker: String, priceBought: String, priceNow: String, numStocksBought: String) {
        self.beginningAmountOfMoney = timeSold
        self.totMoneyToEnd = name
        self.percentageChange = ticker
        self.spyOpen = priceBought
        self.spyClose = priceNow
        self.spyPercentageChange = numStocksBought
    }
}




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
    var totMoneyToEnd: Double
    var percentageChange: Double
    var spyOpen: String
    var spyClose: String
    var spyPercentageChange: Double
    
    init() {
        beginningAmountOfMoney = "N/A"
        totMoneyToEnd = -1
        percentageChange = -1
        spyOpen = "N/A"
        spyClose = "N/A"
        spyPercentageChange = -1
    }
    
}




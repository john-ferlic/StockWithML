//
//  stockSold.swift
//  Stock
//
//  Created by ctsuser on 1/21/20.
//  Copyright © 2020 ctsuser. All rights reserved.
//

import Foundation

class stockSold: Codable {
    var timeSold: String
    var name: String
    var ticker: String
    var priceBought: Double
    var priceNow: Double
	var numStocksBought: String
	
	init() {
		timeSold = "N/A"
		name = "N/A"
		ticker = "N/A"
		priceBought = -1
		priceNow = -1
		numStocksBought = "N/A"
	}
    
	init(timeSold: String, name: String, ticker: String, priceBought: Double, priceNow: Double, numStocksBought: String) {
        self.timeSold = timeSold
        self.name = name
        self.ticker = ticker
        self.priceBought = priceBought
        self.priceNow = priceNow
		self.numStocksBought = numStocksBought
    }
}

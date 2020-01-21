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
    var priceBought: String
    var priceNow: String
	var numStocksBought: String
	
	init() {
		timeSold = "N/A"
		name = "N/A"
		ticker = "N/A"
		priceBought = "N/A"
		priceNow = "N/A"
		numStocksBought = "N/A"
	}
    
	init(timeSold: String, name: String, ticker: String, priceBought: String, priceNow: String, numStocksBought: String) {
        self.timeSold = timeSold
        self.name = name
        self.ticker = ticker
        self.priceBought = priceBought
        self.priceNow = priceNow
		self.numStocksBought = numStocksBought
    }
}

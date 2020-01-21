//
//  boughtStock.swift
//  Stock
//
//  Created by John Ferlic on 1/20/20.
//  Copyright © 2020 ctsuser. All rights reserved.
//

import Foundation

class boughtStock: Codable {
    var ticker: String
    var price: String
    var name: String
    var numStocks: String
    var totStockPrice: String
	
	init() {
		ticker = "N/A"
		price = "N/A"
		name = "N/A"
		numStocks = "N/A"
		totStockPrice = "N/A"
	}
    
    init(ticker: String, price: String, name: String, numStocks: String, totStockPrice: String) {
        self.ticker = ticker
        self.price = price
        self.name = name
        self.numStocks = numStocks
        self.totStockPrice = totStockPrice
    }
}

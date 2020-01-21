//
//  StockBoughtDetailsViewController.swift
//  Stock
//
//  Created by John Ferlic on 1/20/20.
//  Copyright © 2020 ctsuser. All rights reserved.
//

import UIKit

class StockBoughtDetailsViewController: UIViewController {
    
	@IBOutlet weak var stockNameLabel: UILabel!
	@IBOutlet weak var tickerLabel: UILabel!
	@IBOutlet weak var priceLabel: UILabel!
	@IBOutlet weak var numStocksLabel: UILabel!
	@IBOutlet weak var totalPriceLabel: UILabel!
	
	
	var stock = boughtStock()

    override func viewDidLoad() {
        super.viewDidLoad()
		stockNameLabel.text = stock.name
        tickerLabel.text = stock.ticker
		priceLabel.text = stock.price
		numStocksLabel.text = stock.numStocks
		totalPriceLabel.text = stock.totStockPrice
		tickerLabel.layer.borderColor = UIColor.green.cgColor
		tickerLabel.layer.borderWidth = 3.0
		
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

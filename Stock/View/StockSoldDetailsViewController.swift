//
//  StockSoldDetailsViewController.swift
//  Stock
//
//  Created by ctsuser on 1/21/20.
//  Copyright © 2020 ctsuser. All rights reserved.
//

import UIKit

class StockSoldDetailsViewController: UIViewController {
	
	
	@IBOutlet weak var nameLabel: UILabel!
	@IBOutlet weak var timeSoldLabel: UILabel!
	@IBOutlet weak var tickerLabel: UILabel!
	@IBOutlet weak var priceBoughtLabel: UILabel!
	@IBOutlet weak var priceSoldLabel: UILabel!
	@IBOutlet weak var numStocksBoughtLabel: UILabel!
	
	var stock = stockSold()
	
    override func viewDidLoad() {
        super.viewDidLoad()
		setupLabels()
        
		
        // Do any additional setup after loading the view.
    }
    

    func setupLabels(){
        nameLabel.text = stock.name
        timeSoldLabel.text = stock.timeSold
        tickerLabel.text = stock.ticker
        priceBoughtLabel.text = stock.priceBought
        priceSoldLabel.text = stock.priceNow
        numStocksBoughtLabel.text = stock.numStocksBought
        
        let stockPriceBought = Float(stock.priceBought) ?? 0
        let stockPriceSold = Float(stock.priceNow) ?? 0
        
        if stockPriceSold < stockPriceBought {
            nameLabel.textColor = UIColor.red
        } else {
            nameLabel.textColor = UIColor.green
        }
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

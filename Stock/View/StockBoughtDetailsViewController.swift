//
//  StockBoughtDetailsViewController.swift
//  Stock
//
//  Created by John Ferlic on 1/20/20.
//  Copyright © 2020 ctsuser. All rights reserved.
//

import UIKit

class StockBoughtDetailsViewController: UIViewController {
    
    @IBOutlet weak var tickerLabel: UILabel!
    
    var stock = boughtStock(ticker: "NA", price: "NA", name: "NA", numStocks: "NA", totStockPrice: "NA")

    override func viewDidLoad() {
        print(stock.ticker)
        print(stock.name)
        super.viewDidLoad()
        tickerLabel.text = stock.ticker
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

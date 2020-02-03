//
//  StocksBoughtTableViewController.swift
//  Stock
//
//  Created by John Ferlic on 1/20/20.
//  Copyright © 2020 ctsuser. All rights reserved.
//

import UIKit

class StocksBoughtTableViewController: UITableViewController {
    
    var viewModel = ViewModel()
    var boughtStocks = [boughtStock]()
	
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.getStocksBought { result in
            if result == nil {
                self.alert(message: "Error Getting Data :(")
                return
            }
            self.boughtStocks = result!
            self.tableView.reloadData()
        }
		self.tableView.reloadData()
		self.clearsSelectionOnViewWillAppear = true
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return boughtStocks.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath) as? StocksBoughtCell else {
            fatalError("The dequeued cell is not an instance of StocksBoughtCell.")
        }
        let stock = boughtStocks[indexPath.row]
        cell.stockName.text = stock.name    
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "stockBoughtDetailsSegueId", sender: indexPath.row)
    }
	
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let indexPath = tableView.indexPathForSelectedRow {
            guard let destinationVC = segue.destination as? StockBoughtDetailsViewController else {return}
            let selectedRow = indexPath.row
            destinationVC.stock = boughtStocks[selectedRow]
        }
	}
}

extension UITableViewController {
  func alert(message: String, title: String = "") {
    let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
    let OKAction = UIAlertAction(title: "OK", style: .default, handler: nil)
    alertController.addAction(OKAction)
    self.present(alertController, animated: true, completion: nil)
  }
}

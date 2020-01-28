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
		
		
//		let testData = boughtStock(ticker: "TSLA", price: "455", name: "Tesla", numStocks: "2", totStockPrice: "910")
//		boughtStocks += [testData]
		self.tableView.reloadData()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
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

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

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

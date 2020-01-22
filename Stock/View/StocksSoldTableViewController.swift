//
//  StocksSoldTableViewController.swift
//
//
//  Created by ctsuser on 1/21/20.
//
import UIKit

class StocksSoldTableViewController: UITableViewController {

    var viewModel = ViewModel()
    var soldStocks = [stockSold]()

        override func viewDidLoad() {
            super.viewDidLoad()
            viewModel.getStocksSold { result in
                if result == nil {
                    self.alert(message: "Error Getting Data :(")
                    return
                }
                self.soldStocks = result!
                self.tableView.reloadData()
            }
            
//            let stock = stockSold(timeSold: "2:30", name: "Tesla", ticker: "TSLA", priceBought: "420", priceNow: "450", numStocksBought: "2")
//            soldStocks += [stock]
            
            self.tableView.reloadData()
            // Uncomment the following line to preserve selection between presentations
            // self.clearsSelectionOnViewWillAppear = false
            // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
            // self.navigationItem.rightBarButtonItem = self.editButtonItem
        }


    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return soldStocks.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         guard let cell = tableView.dequeueReusableCell(withIdentifier: "stockSoldIdentifier", for: indexPath) as? StockSoldCell else {
                   fatalError("The dequeued cell is not an instance of StockSoldCell.")
               }
        let stock = soldStocks[indexPath.row]
        cell.stockSoldLabel.text = stock.name

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
           self.performSegue(withIdentifier: "stockSoldSegueIdentifier", sender: indexPath.row)
    }


    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if let indexPath = tableView.indexPathForSelectedRow {
            guard let destinationVC = segue.destination as? StockSoldDetailsViewController else {return}
            let selectedRow = indexPath.row
            destinationVC.stock = soldStocks[selectedRow]
        }
        
    }

}

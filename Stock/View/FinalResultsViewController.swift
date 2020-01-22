//
//  FinalResultsViewController.swift
//  Stock
//
//  Created by John Ferlic on 1/21/20.
//  Copyright © 2020 ctsuser. All rights reserved.
//

import UIKit

class FinalResultsViewController: UIViewController {

    @IBOutlet weak var beginningMoneyLabel: UILabel!
    @IBOutlet weak var endingMoneyLabel: UILabel!
    @IBOutlet weak var percentChangeLabel: UILabel!
    @IBOutlet weak var spyBeginningMoneyLabel: UILabel!
    @IBOutlet weak var spyEndingMoneyLabel: UILabel!
    @IBOutlet weak var spyPercentChangeLabel: UILabel!
    
    var fresult = finalResult()
    let viewModel = ViewModel()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
//        viewModel.getStocksBought { result in
//            if result == nil {
//                self.alert(message: "Error Getting Data :(")
//                return
//            }
//        }
        
        beginningMoneyLabel.text = fresult.beginningAmountOfMoney
        endingMoneyLabel.text = fresult.totMoneyToEnd
        percentChangeLabel.text = fresult.percentageChange
        spyBeginningMoneyLabel.text = fresult.spyOpen
        spyEndingMoneyLabel.text = fresult.spyClose
        spyPercentChangeLabel.text = fresult.spyPercentageChange
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

//
//  ViewController.swift
//  Stock
//
//  Created by ctsuser on 5/15/19.
//  Copyright © 2019 ctsuser. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController{
    @IBOutlet weak var stocksBought: UIButton!
	@IBOutlet weak var stocksSold: UIButton!
    @IBOutlet weak var finalResults: UIButton!
    
    let viewModel = ViewModel()
    var fResult = finalResult()
    
    override func viewDidLoad() {
        super.viewDidLoad()
		stocksBought.layer.cornerRadius = stocksBought.frame.size.height/2
		stocksSold.layer.cornerRadius = stocksSold.frame.size.height/2
        finalResults.layer.cornerRadius = finalResults.frame.size.height/2
        
        viewModel.getFinalResults { fResult in
            self.fResult = fResult!
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? FinalResultsViewController {
            destination.fresult = self.fResult
        }
    }
    
}


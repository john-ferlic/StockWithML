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
    
    override func viewDidLoad() {
        super.viewDidLoad()
		stocksBought.layer.cornerRadius = stocksBought.frame.size.height/2
		stocksSold.layer.cornerRadius = stocksSold.frame.size.height/2
        finalResults.layer.cornerRadius = finalResults.frame.size.height/2
        
        
    }
    
}


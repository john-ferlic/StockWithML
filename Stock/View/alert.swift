//
//  alert.swift
//  Stock
//
//  Created by John Ferlic on 1/29/20.
//  Copyright © 2020 ctsuser. All rights reserved.
//

import Foundation
import UIKit

protocol alertDelegate: class {
    func displayAlert(message: String)
}

class alert {
    weak var delegate: alertDelegate?
    
    func printStuff() {
        //Do something important here
        let x = String(RAND_MAX)
        delegate?.displayAlert(message: x)
    }
}

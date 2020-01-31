//
//  alertPopUp.swift
//  Stock
//
//  Created by John Ferlic on 1/29/20.
//  Copyright © 2020 ctsuser. All rights reserved.
//

import Foundation
import UIKit

protocol alertPopUpDelegate: class {
    func showAlert(message: String, title: String)
}

class alertPopUp: UIViewController, alertPopUpDelegate {
    func showAlert(message: String, title: String = "") {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(OKAction)
        self.present(alertController, animated: true, completion: nil)
    }
}

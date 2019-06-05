//
//  ViewController.swift
//  Stock
//
//  Created by ctsuser on 5/15/19.
//  Copyright © 2019 ctsuser. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {
  
  @IBOutlet weak var resultView: ResultView!
  var viewModel = ViewModel()
  @IBOutlet weak var symbolTextField: UITextField!
  @IBAction func searchButton(_ sender: Any) {
    guard let symbol = symbolTextField.text else {
      return
    }
    viewModel.getData(symbol: symbol) { result in
      DispatchQueue.main.async {
        self.resultView.firstLabel.text = result.first
        self.resultView.secondLabel.text = result.second
        self.resultView.thirdLabel.text = result.third
        self.resultView.fourthLabel.text = result.fourth
      }
    }
  }

override func viewDidLoad() {
  super.viewDidLoad()
  symbolTextField.text = ""
}

}


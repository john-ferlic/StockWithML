//
//  ResultView.swift
//  Stock
//
//  Created by ctsuser on 5/21/19.
//  Copyright © 2019 ctsuser. All rights reserved.
//

import UIKit

class ResultView: UIView {

  @IBOutlet weak var firstLabel: UILabel!
  @IBOutlet weak var secondLabel: UILabel!
  @IBOutlet weak var thirdLabel: UILabel!
  @IBOutlet weak var fourthLabel: UILabel!
  @IBOutlet var resultView: UIView!
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    commonInit()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    commonInit()
  }
  
  private func commonInit() {
    Bundle.main.loadNibNamed("ResultView", owner: self, options: nil)
    addSubview(resultView)
    resultView.frame = self.bounds
    resultView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
  }

}

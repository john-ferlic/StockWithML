//
//  StockSoldCell.swift
//  Stock
//
//  Created by ctsuser on 1/21/20.
//  Copyright © 2020 ctsuser. All rights reserved.
//

import UIKit

class StockSoldCell: UITableViewCell {

	@IBOutlet weak var stockSoldLabel: UILabel!
    @IBOutlet var arrowImage: UIImageView!
    
	override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

}

//
//  StocksBoughtCell.swift
//  Stock
//
//  Created by John Ferlic on 1/19/20.
//  Copyright © 2020 ctsuser. All rights reserved.
//

import UIKit

class StocksBoughtCell: UITableViewCell {
    
    @IBOutlet weak var stockName: UILabel!
    @IBOutlet weak var stockPrice: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

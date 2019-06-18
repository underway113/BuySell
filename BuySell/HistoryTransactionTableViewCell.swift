//
//  HistoryTransactionTableViewCell.swift
//  BuySell
//
//  Created by Jeremy Adam on 18/06/19.
//  Copyright © 2019 Underway. All rights reserved.
//

import UIKit

class HistoryTransactionTableViewCell: UITableViewCell {

    @IBOutlet weak var timeTransactionLabel: UILabel!
    @IBOutlet weak var typeTransactionLabel: UILabel!
    @IBOutlet weak var priceTransactionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }

}

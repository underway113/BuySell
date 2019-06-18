//
//  HistoryTransaction.swift
//  BuySell
//
//  Created by Jeremy Adam on 18/06/19.
//  Copyright © 2019 Underway. All rights reserved.
//

import Foundation

class HistoryTransaction {
    var time:String = ""
    var type:String = ""
    var price:Int = 0
    
    init() {
        
    }
    
    init(_ timeInput:String, _ typeInput:String, _ priceInput:Int) {
        time = timeInput
        type = typeInput
        price = priceInput
    }
    
}

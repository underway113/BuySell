//
//  Common.swift
//  BuySell
//
//  Created by Jeremy Adam on 18/06/19.
//  Copyright © 2019 Underway. All rights reserved.
//

import Foundation


func formatNumber(_ number:Int) -> String {
    let formatter = NumberFormatter()
    formatter.numberStyle = .currency
    formatter.maximumFractionDigits = 0
    formatter.locale = Locale.init(identifier: "id-ID")
    formatter.currencyCode = "Rp "
    
    return formatter.string(for: number) ?? "Invalid Value"
}

func dateNow() -> String {
    let now = Date()
    let formatter = DateFormatter()
    let dateFormat = "dd MMM HH:mm:ss"
    
    formatter.timeZone = TimeZone.current
    formatter.dateFormat = dateFormat
    
    return formatter.string(from: now)
    
}

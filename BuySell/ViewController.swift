//
//  ViewController.swift
//  BuySell
//
//  Created by Jeremy Adam on 17/06/19.
//  Copyright © 2019 Underway. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    var timer = Timer()
    
    var historyTransaction:[HistoryTransaction] = []
    var price = 100
    var balance = 1000
    var buyFee = 0.015
    var sellFee = 0.025
    
    var firstBalance = 1000
    var profit = 0
    var unit = 0
    
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var balanceLabel: UILabel!
    @IBOutlet weak var unitLabel: UILabel!
    @IBOutlet weak var profitLabel: UILabel!
    
    @IBOutlet weak var historyTransactionTableView: UITableView!

    @IBOutlet weak var buyButton: UIButton!
    @IBOutlet weak var sellButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        historyTransactionTableView.dataSource = self
        historyTransactionTableView.delegate = self

        updateLabel()
        updatePrice()
        
    }
    
    @IBAction func sellButtonPressed(_ sender: UIButton) {
        
        balance += Int(Double(price) * (1.0 - sellFee))
        unit -= 1
        
        let newHistory:HistoryTransaction = HistoryTransaction(dateNow(), "SELL", price)
        
        historyTransaction.insert(newHistory, at: 0)
        
        self.historyTransactionTableView.reloadData()
        updateLabel()
        
    }
    
    @IBAction func buyButtonPressed(_ sender: UIButton) {

        balance -= Int(Double(price) * (1.0 + buyFee))
        unit += 1
        
        let newHistory:HistoryTransaction = HistoryTransaction(dateNow(), "BUY", price)
     
        historyTransaction.insert(newHistory, at: 0)
        
        self.historyTransactionTableView.reloadData()
        updateLabel()
        
    }
    
    
    func updateLabel() {
        balanceLabel.text = "\(formatNumber(balance))"
        unitLabel.text = "\(unit)"
        profitLabel.text = "\(formatNumber(profit))"
        profitCalculate()
        
        if balance <= 0 || balance < price {
            buyButton.isEnabled = false
        }
        else {
            buyButton.isEnabled = true
        }
        
        if unit == 0 {
            sellButton.isEnabled = false
        }
        else {
            sellButton.isEnabled = true
        }
        
    }
    
    func updatePrice() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: Selector(("randomChangePrice")), userInfo: nil, repeats: true)
    }

    @objc func randomChangePrice() {
        
        let percentSensitivity = 3
        let valueSensitivity = (price * percentSensitivity) / 100
        
        var upperThreshold = 07
        var lowerThreshold = 0
        
        upperThreshold = Int.random(in: 0...13)
        lowerThreshold = Int.random(in: 0...10)
        
        let randomValue = Int.random(in: (-valueSensitivity - lowerThreshold)...(valueSensitivity + upperThreshold))
        
        price += randomValue
        
        if price < 10 {
            price = 10
        }
        
        priceLabel.text = "\(formatNumber(price))"
        
        profitCalculate()
        
    }
    
    func profitCalculate() {
        profit = (unit * price) + (balance - firstBalance)
        profitLabel.text = "\(formatNumber(profit))"
        profitColorChange()
    }
    
    func profitColorChange() {
        if profit < 0 {
            profitLabel.textColor = UIColor.red
        }
        else if profit > 0 {
            profitLabel.textColor = UIColor.green
        }
        else {
           profitLabel.textColor = UIColor.black
        }
        
    }
    
    
    // MARK: History Transaction Table View
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return historyTransaction.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "historyCell", for: indexPath) as! HistoryTransactionTableViewCell
        
        cell.timeTransactionLabel.text = historyTransaction[indexPath.row].time
        cell.typeTransactionLabel.text = historyTransaction[indexPath.row].type
        cell.priceTransactionLabel.text = formatNumber(historyTransaction[indexPath.row].price)
     
        return cell
    }
    //

}


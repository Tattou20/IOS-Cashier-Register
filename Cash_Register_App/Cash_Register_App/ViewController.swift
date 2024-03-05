//
//  ViewController.swift
//  Cash_Register_App
//
//  Created by user238581 on 3/4/24.
//

import UIKit

class ViewController: UIViewController {
    
    var firstValue = false
    var subTotal: Int?
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet weak var selectProductLabel: UILabel!
    @IBOutlet weak var displayDigit: UILabel!
    
    let names = [
        "Pants",
        "Shoes",
        "Hats",
        "Teeshirts",
        "Dresses"
    ]
    
    let quantity = [
        23,
        52,
        10,
        13,
        24
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
       
       
        
    }
    
    @IBAction func pressZero(_ sender: UIButton) {
        if firstValue {
                     displayDigit.text = "0"
                 } else {
                     displayDigit.text = displayDigit.text! + "0"
                 }
    }
    @IBAction func pressOne(_ sender: UIButton) {
        if firstValue {
                     displayDigit.text = "1"
                 } else {
                     displayDigit.text = displayDigit.text! + "1"
                 }
    }
    @IBAction func pressTwo(_ sender: UIButton) {
        if firstValue {
                     displayDigit.text = "2"
                 } else {
                     displayDigit.text = displayDigit.text! + "2"
                 }
    }
    @IBAction func pressThree(_ sender: UIButton) {
        if firstValue {
                     displayDigit.text = "3"
                 } else {
                     displayDigit.text = displayDigit.text! + "3"
                 }
    }
    @IBAction func pressFour(_ sender: UIButton) {
        if firstValue {
                     displayDigit.text = "4"
                 } else {
                     displayDigit.text = displayDigit.text! + "4"
                 }
    }
    @IBAction func pressFive(_ sender: UIButton) {
        if firstValue {
                     displayDigit.text = "5"
                 } else {
                     displayDigit.text = displayDigit.text! + "5"
                 }
    }
    @IBAction func pressSix(_ sender: UIButton) {
        if firstValue {
                     displayDigit.text = "6"
                 } else {
                     displayDigit.text = displayDigit.text! + "6"
                 }
    }
    @IBAction func pressSeven(_ sender: UIButton) {
        if firstValue {
                     displayDigit.text = "7"
                 } else {
                     displayDigit.text = displayDigit.text! + "7"
                 }
    }
    @IBAction func pressEight(_ sender: UIButton) {
        if firstValue {
                     displayDigit.text = "8"
                 } else {
                     displayDigit.text = displayDigit.text! + "8"
                 }
    }
    @IBAction func pressNine(_ sender: UIButton) {
        if firstValue {
                     displayDigit.text = "9"
                 } else {
                     displayDigit.text = displayDigit.text! + "9"
                 }
    }}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectProduct = names[indexPath.row]
        selectProductLabel.text = selectProduct
    }
}

extension ViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = "\(names[indexPath.row]) \(quantity[indexPath.row])"
        
        return cell
    }
}

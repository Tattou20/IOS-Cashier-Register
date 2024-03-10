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
    
    @IBOutlet weak var totalPrice: UILabel!
    
    let names = [
        "Pants",
        "Shoes",
        "Hats",
        "Teeshirts",
        "Dresses"
    ]
    
    var quantity = [
        23,
        52,
        10,
        13,
        24
    ]
    
    let prices = [
        40,
        20,
        10,
        30,
        50
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
    }
    
    @IBAction func calculTotalPrice(_ sender: Any) {
        let prices: [Double] = [40, 20, 10, 30, 50]
        
        if let inputValue = Double(displayDigit.text ?? ""), !prices.isEmpty {
            if selectProductLabel.text == "Pants" {
                let total = inputValue * prices[0]
                totalPrice.text = String(total)
            } else if selectProductLabel.text == "Shoes" {
                let total = inputValue * prices[1]
                totalPrice.text = String(total)
            } else if selectProductLabel.text == "Hats" {
                let total = inputValue * prices[2]
                totalPrice.text = String(total)
            } else if selectProductLabel.text == "Teeshirts" {
                let total = inputValue * prices[3]
                totalPrice.text = String(total)
            } else if selectProductLabel.text == "Dresses" {
                let total = inputValue * prices[4]
                totalPrice.text = String(total)
            } else {
                totalPrice.text = "Total"
            }
        }
        
    }
    
    @IBAction func buyProduct(_ sender: Any) {
           guard let selectedProduct = selectProductLabel.text else {
               print("Please select a product before buying.")
               return
           }

           guard let inputValue = Double(displayDigit.text ?? "") else {
               print("Invalid input value.")
               return
           }

           guard let selectedIndex = names.firstIndex(of: selectedProduct) else {
               print("Selected product not found.")
               return
           }

           if inputValue > Double(quantity[selectedIndex]) {
               showAlert(message: "Not enough \(selectedProduct) in stock!")
           } else {
               quantity[selectedIndex] -= Int(inputValue)

               resetUI()

               tableView.reloadData()

               if selectedProduct == "Hats" {
                   quantity[2] = 0
               }

               showAlert(message: "\(inputValue) \(selectedProduct) purchased successfully!")
           }
       }
    
    func resetUI() {
            // Reset the user interface logic here
            // This could involve clearing input fields, updating labels, etc.
            displayDigit.text = "0"
            selectProductLabel.text = "Select a Product"
            totalPrice.text = "Total"
        }
    
    func showAlert(message: String) {
            let alert = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
        }
    
    
    @IBAction func clearQuantity(_ sender: Any) {
        displayDigit.text = "0"    }
    
}

    

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
        
        cell.textLabel?.text = "\(names[indexPath.row])  $\(prices[indexPath.row])                                          \(quantity[indexPath.row]) "
        
        return cell
    }
}
    

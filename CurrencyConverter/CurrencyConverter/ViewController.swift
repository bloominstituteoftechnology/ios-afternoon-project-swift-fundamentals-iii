//
//  ViewController.swift
//  CurrencyConverter
//
//  Created by Ben Gohlke on 8/7/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit
// ** CURRENCY ENUM **
enum Currency {
    case cad
    case mxn
}

class ViewController: UIViewController {
    
    var currency: Currency = .cad
    
    // MARK: - Outlets/Properties
    
    @IBOutlet weak var fromCurrencyTextField: UITextField!
    @IBOutlet weak var toCurrencyTextField: UITextField!
    
    @IBOutlet weak var toCurrencyLabel: UILabel!
    
    @IBOutlet weak var cadButton: UIButton!
    @IBOutlet weak var mxnButton: UIButton!

    // MARK: - **Actions**
    
    @IBAction func convertButtonTapped(_ sender: UIButton) {
        guard let fromCurrencyString = fromCurrencyTextField.text else { return }
            
        guard let fromCurrency = Double(fromCurrencyString) else {
            print("Invalid Input")
            return
            }
     let finalAmount = convert(fromCurrency)
        
        toCurrencyTextField.text = String(finalAmount)
    }
    
    @IBAction func cadButtonTapped(_ sender: UIButton) {
        sender.isSelected.toggle()
        mxnButton.isSelected.toggle()
        
        if cadButton.isSelected {
            currency = .cad
            toCurrencyLabel.text = "Currency (CAD)"
        }
    }
    
    @IBAction func mxnButtonTapped(_ sender: UIButton) {
        sender.isSelected.toggle()
        cadButton.isSelected.toggle()
        
        if mxnButton.isSelected {
            currency = .mxn
            toCurrencyLabel.text = "Currency (MXN)"
        }
    }
    
    // MARK: - **Helper Methods**
// Note $1 USD = $1.32 CAD,     $1 USD = $19.14 MXN (AS OF NOV. 7 2019)
    func convert(_ dollars: Double) -> Double {
        let finalNumber: Double
        
        if currency == .cad {
            finalNumber = dollars * 1.32
        } else {
            finalNumber = dollars * 19.14
        }
        return finalNumber
    }



}


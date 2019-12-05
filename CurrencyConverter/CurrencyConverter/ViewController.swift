//
//  ViewController.swift
//  CurrencyConverter
//
//  Created by Ben Gohlke on 8/7/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

enum Currency {
    case cad
    case mxn
}

var currency = Currency.cad




class ViewController: UIViewController {
    
    // MARK: - Outlets/Properties
    
    @IBOutlet weak var fromCurrencyTextField: UITextField!
    @IBOutlet weak var toCurrencyTextField: UITextField!
    
    @IBOutlet weak var toCurrencyLabel: UILabel!
    
    @IBOutlet weak var cadButton: UIButton!
    @IBOutlet weak var mxnButton: UIButton!

    // MARK: - Actions
    
    @IBAction func convertButtonTapped(_ sender: UIButton) {
        guard let userDollarString = fromCurrencyTextField.text else {
            return
        }
        guard let dollarTotal = Double(userDollarString) else {
            print("Invalid dollar amount. Unable to initialize a double from a string.")
            return
        }
        if mxnButton.isSelected == true {
            toCurrencyTextField.text = convertToCurrency(amount: convert(dollarTotal))
        } else if cadButton.isSelected == true {
            toCurrencyTextField.text = convertToCurrency(amount: convert(dollarTotal))
        }
    }
    
    @IBAction func cadButtonTapped(_ sender: UIButton) {
        cadButton.isSelected.toggle()
        mxnButton.isSelected.toggle()
        if cadButton.isSelected == true {
            currency = .cad
        }
        toCurrencyLabel.text = "Currency (CAD)"
    }
    
    @IBAction func mxnButtonTapped(_ sender: UIButton) {
        mxnButton.isSelected = !mxnButton.isSelected
        cadButton.isSelected = !cadButton.isSelected
        if mxnButton.isSelected == true {
            currency = .mxn
        }
        toCurrencyLabel.text = "Currency (MXN)"
    }
    
    // MARK: - Helper Methods
    
    // On December 5th, 2019 conversion values are:
    // $1 USD to $1.32 CAD
    // $1 USD to $19.36 MXN
    
    func convert(_ dollars: Double) -> Double {
        var conversionTotal: Double
        
        if currency == .cad {
            conversionTotal = dollars * 1.32
        } else {
            conversionTotal = dollars * 19.36
        }
        return conversionTotal
    }
    
    func convertToCurrency(amount: Double) -> String {
            let currencyFormatter = NumberFormatter()
            currencyFormatter.numberStyle = .currency
        return currencyFormatter.string(from: NSNumber(value: amount))!
        
    }
}

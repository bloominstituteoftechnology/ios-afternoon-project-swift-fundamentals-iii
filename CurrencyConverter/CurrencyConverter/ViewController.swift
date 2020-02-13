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

var currencyFormatter: NumberFormatter = {
    let formatter = NumberFormatter()
    formatter.numberStyle = .currency
    return formatter
}()

class ViewController: UIViewController {
    
    // MARK: - Outlets/Properties
    
    @IBOutlet weak var fromCurrencyTextField: UITextField!
    @IBOutlet weak var toCurrencyTextField: UITextField!
    
    @IBOutlet weak var toCurrencyLabel: UILabel!
    
    @IBOutlet weak var cadButton: UIButton!
    @IBOutlet weak var mxnButton: UIButton!
    
    var currency: Currency = .cad
    

    // MARK: - Actions
    
    @IBAction func convertButtonTapped(_ sender: UIButton) {
        
        if fromCurrencyTextField.text != nil {
            let fromUSDString: String = fromCurrencyTextField.text!
            guard let fromUSD = Double(fromUSDString) else {
                return
            }
            let result = convert(fromUSD)
            
            toCurrencyTextField.text = currencyFormatter.string(from: NSNumber(value: result))
        }
    }
    
    @IBAction func cadButtonTapped(_ sender: UIButton) {
        cadButton.isSelected = true
        mxnButton.isSelected = false
        
        if cadButton.isSelected {
            currency = .cad
            toCurrencyLabel.text = "Currency (CAD)"
        }
        
    }
    
    @IBAction func mxnButtonTapped(_ sender: UIButton) {
        cadButton.isSelected = false
        mxnButton.isSelected = true
        
        if mxnButton.isSelected {
            currency = .mxn
            toCurrencyLabel.text = "Currency (MXN)"
        }
    }
    
    // MARK: - Helper Methods
    
    /*
         Feb, 12 2020
         $1 USD = 1.33 CAD
         $1 USD = 18.65 MXN
    */
    func convert(_ dollars: Double) -> Double {
        var result: Double = 0
        
        if currency == .cad {
            result = dollars * 1.33
        } else if currency == .mxn {
            result = dollars * 18.65
        }
        
        return result
    }
}


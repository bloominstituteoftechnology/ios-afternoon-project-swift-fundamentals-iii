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
var currency: Currency = Currency.cad

class ViewController: UIViewController {
    
    // MARK: - Outlets/Properties
    
    @IBOutlet weak var fromCurrencyTextField: UITextField!
    @IBOutlet weak var toCurrencyTextField: UITextField!
    
    @IBOutlet weak var toCurrencyLabel: UILabel!
    
    @IBOutlet weak var cadButton: UIButton!
    @IBOutlet weak var mxnButton: UIButton!

    // MARK: - Actions
    
    @IBAction func convertButtonTapped(_ sender: UIButton) {
        guard let usd = fromCurrencyTextField.text else {
            return
        }
        toCurrencyTextField.text = String(convert(Double(usd) ?? 0))
        
        
        
    }
    
    @IBAction func cadButtonTapped(_ sender: UIButton) {
        cadButton.isSelected = true
        mxnButton.isSelected = false
        toCurrencyLabel.text = "Currency (CAD)"
        
        if cadButton.isSelected == true {
         currency = Currency.cad
        }
        
    }
    
    @IBAction func mxnButtonTapped(_ sender: UIButton) {
        mxnButton.isSelected = true
        cadButton.isSelected = false
        toCurrencyLabel.text = "Currency (MXN)"
        
        if mxnButton.isSelected == true {
            currency = Currency.mxn
        }
    }
    
    // MARK: - Helper Methods
    func convertCad(_ dollars:Double) -> Double {
        let cad = dollars * 1.33
        return cad
    }
    
    func convertMxn(_ dollars:Double) -> Double {
        let mxn = dollars * 19.70
        return mxn
    }
    func convert(_ dollars: Double) -> Double {
        if currency == Currency.cad {
           return convertCad(dollars)
        } else {
            return convertMxn(dollars)
        }
    }
}


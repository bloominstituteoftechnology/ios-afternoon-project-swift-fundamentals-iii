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

var currency: Currency = .cad

class ViewController: UIViewController {
    
    // MARK: - Outlets/Properties
    
    @IBOutlet weak var fromCurrencyTextField: UITextField!
    @IBOutlet weak var toCurrencyTextField: UITextField!
    
    @IBOutlet weak var toCurrencyLabel: UILabel!
    
    @IBOutlet weak var cadButton: UIButton!
    @IBOutlet weak var mxnButton: UIButton!
    
    // MARK: - Actions
    
    @IBAction func convertButtonTapped(_ sender: UIButton) {
        guard let fromCurrency = fromCurrencyTextField.text,
            let currencyUSD = Double(fromCurrency) else {return}
       let convertedCurrency = convert(currencyUSD)
        toCurrencyTextField.text = "\(convertedCurrency)"
    }
    
    var currencyCad: Double = 0
    var currencyMxn: Double = 0
    
    
    @IBAction func cadButtonTapped(_ sender: UIButton) {
        
        cadButton.isSelected.toggle()
        mxnButton.isSelected.toggle()
        
        if cadButton.isSelected {
            currency = .cad
            self.toCurrencyLabel.text = "Currency (CAD)"
        } else {
            currency = .mxn
            self.toCurrencyLabel.text = "Currency (MXN)"
        }
    }
    
    @IBAction func mxnButtonTapped(_ sender: UIButton) {
        
        mxnButton.isSelected.toggle()
        cadButton.isSelected.toggle()
        
        if mxnButton.isSelected {
            currency = .mxn
            self.toCurrencyLabel.text = "Currency (MXN)"
        } else {
            currency = .cad
            self.toCurrencyLabel.text = "Currency (CAD)"
        }
    }
    
    
    // MARK: - Helper Methods
    
    func convert(_ dollars: Double) -> Double {
        if cadButton.isSelected {
            currencyCad = dollars * 1.32
            return currencyCad
        } else {
            currencyMxn = dollars * 19.14
            return currencyMxn
        }
    }
}



//
//  ViewController.swift
//  CurrencyConverter
//
//  Created by Ben Gohlke on 8/7/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

enum Currency{
    case cad
    case mxn
}

var currency: Currency = .cad
var uSDCurrency: Double = 0

class ViewController: UIViewController {
    
    // MARK: - Outlets/Properties
    
    @IBOutlet weak var fromCurrencyTextField: UITextField!
    @IBOutlet weak var toCurrencyTextField: UITextField!
    
    @IBOutlet weak var toCurrencyLabel: UILabel!
    
    @IBOutlet weak var cadButton: UIButton!
    @IBOutlet weak var mxnButton: UIButton!

    // MARK: - Actions
    
    @IBAction func convertButtonTapped(_ sender: UIButton) {
        guard let uSCurrencyString = fromCurrencyTextField.text else{
            return
        }
        guard let uSDCurrency = Double(uSCurrencyString) else {
            print("invalid Number")
            return
        }
        
        let convertedCurrency = convert(uSDCurrency)
        
        let currencyFormatter = NumberFormatter()
        currencyFormatter.locale = Locale(identifier: "en_US")
        currencyFormatter.numberStyle = .currency
        let formatedCurrency = currencyFormatter.string(from: convertedCurrency as NSNumber)
        
        guard let currencyOutput = formatedCurrency else{
            return
        }
        toCurrencyTextField.text = "\(currencyOutput)"
    }
    
    
    
    @IBAction func cadButtonTapped(_ sender: Any) {
        
        guard let button = sender as? UIButton else {
            return
        }
        button.isSelected.toggle()
        if button.isSelected {
            currency = .cad
            toCurrencyLabel.text = "Currency (CAD)"
            mxnButton.isSelected.toggle()
        }
        
    }
    
    
    @IBAction func mxnButtonTapped(_ sender: Any) {
        guard let button = sender as? UIButton else {
            return
        }
        button.isSelected.toggle()
        if button.isSelected {
            currency = .mxn
            toCurrencyLabel.text = "Currency (MXN)"
            cadButton.isSelected.toggle()
        }
        
    }
    
    // MARK: - Helper Methods
    
    func convert(_ dollars: Double) -> Double {
        var convertedCurrency: Double = 0.0
        if currency == .cad {
            convertedCurrency = dollars * 1.31 // CAD on 09.10.2019
            }else if currency == .mxn{
                convertedCurrency = dollars * 19.5 // MXN on 09.10.2019
            }
        return convertedCurrency
    }
    
    
    
}

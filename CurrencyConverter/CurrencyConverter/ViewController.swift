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
        
        guard let fromCurrencyString = toCurrencyLabel.text else {
            return
        }
        guard let fromCurrency = Double(fromCurrencyString) else {
            print("Invalid number")
            return
        }
        
        // having issues w/ the convert button, it's only printing "Invalid number"
        
    }
    
    
    @IBAction func cadButtonTapped(_ sender: UIButton) {
        sender.isSelected.toggle()
        
        if cadButton.isSelected {
            mxnButton.isSelected = false
            currency = .cad
            toCurrencyLabel.text = "Currency (CAD)"
        } else {
            cadButton.isSelected = true
            currency = .mxn
            toCurrencyLabel.text = "Currency (MXN)"
        }
        
            
    }
    
    @IBAction func mxnButtonTapped(_ sender: UIButton) {
        sender.isSelected.toggle()
        
        if mxnButton.isSelected {
            cadButton.isSelected = false
            currency = .mxn
            toCurrencyLabel.text = "Currency (MXN)"
        } else {
            mxnButton.isSelected = true
            currency = .mxn
            toCurrencyLabel.text = "Currency (CAD)"
        
    }
    
    // MARK: - Helper Methods

    func convert(_ dollars: Double) -> Double {
        var converted: Double
        
        if currency == Currency.cad {
            converted = dollars * 1.33
        } else {
            converted = dollars * 19.70
        }
        return converted
    }
    
    
    }
}
//test
//

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
        guard let fromCurrencyString = fromCurrencyTextField.text else {
            return
        }
        guard let fromCurrency = Double(fromCurrencyString) else {
            fromCurrencyTextField.text = "Invalid Number"
            toCurrencyTextField.text = ""
            return
        }
        var showConverted: Double
        
        if cadButton.isSelected {
            showConverted = usdToCad(fromCurrency)
        } else {
            showConverted = usdToMxn(fromCurrency)
        }
        
        toCurrencyTextField.text = "\(showConverted)"
    }
    
    @IBAction func cadButtonTapped(_ sender: UIButton) {
        sender.isSelected.toggle()
        if cadButton.isSelected {
            currency = Currency.cad
            mxnButton.isSelected = false
            toCurrencyLabel.text = "Currency (CAD)"
        }
    }
    
    @IBAction func mxnButtonTapped(_ sender: UIButton) {
        sender.isSelected.toggle()
        if mxnButton.isSelected {
            currency = Currency.mxn
            cadButton.isSelected = false
            toCurrencyLabel.text = "Currency (MXN)"
        }
    }
    
    // MARK: - Helper Methods
    func usdToCad(_ usd: Double) -> Double {
        let convertedCad = usd * 1.32
        return convertedCad
    }
    func usdToMxn(_ usd: Double) -> Double {
        let convertedMxn = usd * 19.71
        return convertedMxn
    }
}


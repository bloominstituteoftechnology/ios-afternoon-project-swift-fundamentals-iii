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
        guard let currencyInputTextString = fromCurrencyTextField.text else {return}
        
        guard let userCurrencyInput = Double(currencyInputTextString) else {
            print("Not a valid input. Unable to initialize a double from a string.")
            return
        }
        
        toCurrencyTextField.text = "\(convert(userCurrencyInput))"
    }
    
    @IBAction func cadButtonTapped(_ sender: UIButton) {
        cadButton.isSelected = !cadButton.isSelected
        mxnButton.isSelected = !mxnButton.isSelected
        if cadButton.isSelected {
            currency = .cad
            toCurrencyLabel.text = "Currency (CAD)"
        } else {
            return
        }
    }
    
    @IBAction func mxnButtonTapped(_ sender: UIButton) {
        cadButton.isSelected = !cadButton.isSelected
        mxnButton.isSelected = !mxnButton.isSelected
        if mxnButton.isSelected {
            currency = .mxn
            toCurrencyLabel.text = "Currency (MXN)"
        } else {
            return
        }
        
    }
    
    
    // MARK: - Helper Methods
    
    
    func convert(_ dollars: Double) -> Double {
        var convertedAmount: Double = 0
        
        if currency == Currency.cad {
            convertedAmount = dollars * 1.32
        } else if currency == Currency.mxn {
            convertedAmount = dollars * 19.34
        }
        return convertedAmount
    }
}

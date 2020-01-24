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
        guard let amountEnteredString = fromCurrencyTextField.text else { return }
        
        guard let amountEntered = Double(amountEnteredString) else {
            print("Invalid entry..")
            return
        }
        
        let currencyConverted = convert(amountEntered)
        
        toCurrencyTextField.text = String(currencyConverted)
    }
    
    @IBAction func cadButtonTapped(_ sender: UIButton) {
        guard let button = sender as? UIButton else { return }
        
        if cadButton.isSelected {
            currency = .cad
        }
        
        toCurrencyLabel.text = "Currency (CAD)"
        
        cadButton.isSelected.toggle()
        mxnButton.isSelected.toggle()
        
    }
    
    @IBAction func mxnButtonTapped(_ sender: UIButton) {
        guard let button = sender as? UIButton else { return }
        
        if mxnButton.isSelected {
            currency = .mxn
        }
        
        toCurrencyLabel.text = "Currency (MXN)"
        
        cadButton.isSelected.toggle()
        mxnButton.isSelected.toggle()
        
    }
    
    // MARK: - Helper Methods
    
    func convert(_ dollars: Double) -> Double {
        var convertedValue:Double = 0
        let cadValue = 1.31
        let mxnValue = 18.77
        
        if currency == .cad {
            convertedValue = dollars * cadValue
        } else if currency == .mxn {
            convertedValue = dollars * mxnValue
        }
        
        return convertedValue
    }
}


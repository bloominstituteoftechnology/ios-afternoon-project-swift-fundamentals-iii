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
    case gbp
}

class ViewController: UIViewController {
    
    // MARK: - Outlets/Properties
    
    var currency: Currency = .cad
    
    @IBOutlet weak var fromCurrencyTextField: UITextField!
    @IBOutlet weak var toCurrencyTextField: UITextField!
    
    @IBOutlet weak var toCurrencyLabel: UILabel!
    
    @IBOutlet weak var cadButton: UIButton!
    @IBOutlet weak var mxnButton: UIButton!
    @IBOutlet weak var gbpButton: UIButton!
    
    var currencyFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        return formatter
    } ()
    
    // MARK: - Actions
    
    @IBAction func convertButtonTapped(_ sender: UIButton) {
        guard let fromCurrencyString = fromCurrencyTextField.text else {
            return
        }
        
        guard let currencyInputNumber = Double(fromCurrencyString) else {
            print("Invalid number")
            return
        }
        
        toCurrencyTextField.text = String((convert(currencyInputNumber)))
    }
    
    @IBAction func cadButtonTapped(_ sender: Any) {
        guard let button = sender as? UIButton else {
            return
        }
        
        button.isSelected.toggle()
        if button.isSelected {
            currency = .cad
            toCurrencyLabel.text = "Currency(CAD)"
            toCurrencyTextField.text = ""
            mxnButton.isSelected = false
            gbpButton.isSelected = false
        } else {
            return
        }
    }
    
    @IBAction func mxnButtonTapped(_ sender: Any) {
        guard let button = sender as? UIButton else {
            return
        }
        
        button.isSelected.toggle()
        if button.isSelected {
            currency = .mxn
            toCurrencyLabel.text = "Currency(MXN)"
            toCurrencyTextField.text = ""
            cadButton.isSelected = false
            gbpButton.isSelected = false
        } else {
            return
        }
    }
    
    @IBAction func gbpButtonTapped(_ sender: Any) {
        guard let button = sender as? UIButton else {
            return
        }
        
        button.isSelected.toggle()
        if button.isSelected {
            currency = .gbp
            toCurrencyLabel.text = "Currency(GBP)"
            toCurrencyTextField.text = ""
            cadButton.isSelected = false
            mxnButton.isSelected = false
        } else {
            return
        }
    }
    
    // MARK: - Helper Methods
    func convert(_ dollar: Double) -> Double {
        var convertedValue: Double = 0.0
        if currency == .cad {
            convertedValue = dollar * 1.31
        } else if currency == .mxn {
            convertedValue = dollar * 19.5
        } else if currency == .gbp {
            convertedValue = dollar * 0.76
        }
        return convertedValue
    }
}

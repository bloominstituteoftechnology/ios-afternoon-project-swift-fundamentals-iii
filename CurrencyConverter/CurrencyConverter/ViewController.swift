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

    
    var currencyFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        return formatter
    }()
    
    
    
    
    // MARK: - Actions
    
    @IBAction func convertButtonTapped(_ sender: UIButton) {
        guard let fromCurrencyString = fromCurrencyTextField.text else { return }
        
        guard let fromCurrency = Double(fromCurrencyString) else {
            print("Invalid amount entered")
            return
        }
        
        var amountInCad: Double
        var amountInMxn: Double
        
        if cadButton.isSelected {
            amountInCad = convert(fromCurrency)
            toCurrencyTextField.text = "\(amountInCad)"
        } else {
            if mxnButton.isSelected {
                amountInMxn = convert(fromCurrency)
                toCurrencyTextField.text = "\(amountInMxn)"
            }
        }
    }
    
    
    
    
    
    @IBAction func cadButtonTapped(_ sender: UIButton) {
        guard let button = sender as? UIButton else { return }
        
        cadButton.isSelected.toggle()
        mxnButton.isSelected.toggle()
        
        if cadButton.isSelected {
            currency = .cad
            toCurrencyLabel.text = "Currency (CAD)"
        }
    }
    
    
    
    
    
    @IBAction func mxnButtonTapped(_ sender: UIButton) {
        
        guard let button = sender as? UIButton else { return }
        
        cadButton.isSelected.toggle()
        mxnButton.isSelected.toggle()
        
        if mxnButton.isSelected {
            currency = .mxn
            toCurrencyLabel.text = "Currency (Pesos)"
        }
    }




    
    // MARK: - Helper Methods
    
    func convert(_ dollars: Double) -> Double {
        if currency == .cad {
            let amountInCad = dollars * 1.33
            return amountInCad
        } else if currency == .mxn {
            let amountInMxn = dollars * 19.02
            return amountInMxn
        } else { return 0.0 }
    }
    
}



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
        guard let currencyTextField = fromCurrencyTextField.text else { return }

        guard let currencyNumber = Double(currencyTextField) else {
            print("Dollar amount not valid.")
            return }

        var conversion: Double
        
        if cadButton.isSelected {
            conversion = convert(currencyNumber)
        } else {
            conversion = convert(currencyNumber)
        }
        
        toCurrencyTextField.text = "\(conversion)"
        
    }
    
    @IBAction func cadButtonTapped(_ sender: UIButton) {
        cadButton.isSelected.toggle()
        mxnButton.isSelected.toggle()
        
        if cadButton.isSelected {
            currency = .cad
            toCurrencyLabel.text = "Currency (CAD)"
        } else {
            return
        }
        
        
        
    }
    
    @IBAction func mxnButtonTapped(_ sender: UIButton) {
        mxnButton.isSelected.toggle()
        cadButton.isSelected.toggle()
        
        
        if mxnButton.isSelected {
            currency = .mxn
            toCurrencyLabel.text = "Currency (MXN)"
        } else {
            return
        }
        
    }
    
    // MARK: - Helper Methods
    
    func convert(_ dollars: Double) -> Double {
        var conversion: Double
        
        
        if currency == .cad {
            conversion = dollars * 1.33
        } else {
            conversion = dollars * 19.79
        }
     return conversion
    }


}

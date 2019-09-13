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

//let currency = Currency.cad

class ViewController: UIViewController {
    
    var currency: Currency = Currency.cad
    
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
        
        guard let currencyUSD = Double(fromCurrencyString) else {
            print("Not a valid number")
            return
        }
        
        
        let conversion = convert(dollars: currencyUSD)
        toCurrencyTextField.text = "\(conversion)"
        
    }
    
    
    @IBAction func cadButtonTapped(_ sender: UIButton) {
        
        sender.isSelected.toggle()
        mxnButton.isSelected.toggle()
        if sender.isSelected {
            currency = .cad
            toCurrencyLabel.text = "Currency (CAD)"
        }
    }
    
   
    
    @IBAction func mxnButtonTapped(_ sender: UIButton) {
        
        sender.isSelected.toggle()
        cadButton.isSelected.toggle()
        if sender.isSelected {
            currency = .mxn
            toCurrencyLabel.text = "Currency (MXN)"
        }
    }
        
    
    
    // MARK: - Helper Methods //Functions
    
    func convert(dollars: Double) -> Double {
        var conversion: Double
        
        if currency == Currency.cad {
            conversion = dollars * 1.33
            return conversion
        } else {
                conversion = dollars * 19.7
                return conversion
            }
        }

}


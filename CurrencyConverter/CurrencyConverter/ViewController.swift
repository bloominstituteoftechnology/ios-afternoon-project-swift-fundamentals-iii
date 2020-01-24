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
        guard let fromCurrencyString = fromCurrencyTextField.text else { return }
        guard let fromCurrency = Double(fromCurrencyString) else {
            print("Invalid number")
            return
        }
        let conversion: Double
        
        if cadButton.isSelected {
            conversion = convertCad(fromCurrency)
        } else {
            conversion = convertMxn(fromCurrency)
        }
        
        toCurrencyTextField.text = "\(conversion)"
    }
    
    @IBAction func cadButtonTapped(_ sender: UIButton) {
        let cadButton = sender
        cadButton.isSelected.toggle()
        mxnButton.isSelected.toggle()
        
        if cadButton.isSelected == true {
            currency = Currency.cad
            toCurrencyLabel.text = "Currency (CAD)"
        }
    }
    
    @IBAction func mxnButtonTapped(_ sender: UIButton) {
        let mxnButton = sender
        mxnButton.isSelected.toggle()
        cadButton.isSelected.toggle()
        
        if mxnButton.isSelected == true {
            currency = Currency.mxn
            toCurrencyLabel.text = "Currency (MXN)"
        }
    }
    
    // MARK: - Helper Methods
    
    func convertCad(_ dollars: Double) -> Double {
        let conversion = dollars * 1.31
        return conversion
    }

    func convertMxn(_ dollars: Double) -> Double {
        let conversion = dollars * 18.78
        return conversion
    }
    
}


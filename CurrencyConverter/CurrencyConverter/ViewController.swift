//
//  ViewController.swift
//  CurrencyConverter
//
//  Created by Ben Gohlke on 8/7/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

// MARK: - Types

enum Currency {
    case cad
    case mxn
}

class ViewController: UIViewController {
    
    // MARK: - Outlets/Properties
    
    @IBOutlet weak var fromCurrencyTextField: UITextField!
    @IBOutlet weak var toCurrencyTextField: UITextField!
    
    @IBOutlet weak var toCurrencyLabel: UILabel!
    
    @IBOutlet weak var cadButton: UIButton!
    @IBOutlet weak var mxnButton: UIButton!
    
    let currency: Currency = Currency.cad

    // MARK: - Actions
    
    @IBAction func convertButtonTapped(_ sender: UIButton) {
        // convert string to double check if valid
        
        guard let userInput = fromCurrencyTextField.text else { return }
        guard let userInputDouble = Double(userInput) else { return }

        // show converted currency result

        if mxnButton.isSelected {
            toCurrencyTextField.text = String(usd2mex(userInput: userInputDouble))

        } else {
            toCurrencyTextField.text = String(usd2cad(userInput: userInputDouble))
        
        // show converted currency result
    }
    }
    
    // currency toggle
    @IBAction func cadButtonTapped(_ sender: UIButton) {
        if mxnButton.isSelected == true {
            cadButton.isSelected.toggle()
            mxnButton.isSelected.toggle()
        }
    }
    
    @IBAction func mxnButtonTapped(_ sender: UIButton) {
        if cadButton.isSelected == true {
            mxnButton.isSelected.toggle()
            cadButton.isSelected.toggle()
        }
    }
    
    // MARK: - Helper Methods
}

// conversion rates mxn: 19.23, cad: 1.32

func usd2cad(userInput: Double) -> Double {
    return userInput * 1.32
}

func usd2mex(userInput: Double) -> Double {
    return userInput * 19.23
}

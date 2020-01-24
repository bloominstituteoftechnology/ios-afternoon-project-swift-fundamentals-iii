//
//  ViewController.swift
//  CurrencyConverter
//
//  Created by Ben Gohlke on 8/7/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

// Step 1
enum Currency {
    case cad
    case mxn
}

// Step 2
var currency: Currency = .cad

class ViewController: UIViewController {
    
    // MARK: - Outlets/Properties
    
    @IBOutlet weak var fromCurrencyTextField: UITextField!
    @IBOutlet weak var toCurrencyTextField: UITextField!
    
    @IBOutlet weak var toCurrencyLabel: UILabel!
    
    @IBOutlet weak var cadButton: UIButton!
    @IBOutlet weak var mxnButton: UIButton!

    // MARK: - Actions
    // Step 7
    @IBAction func convertButtonTapped(_ sender: UIButton) {
        guard let amountString = fromCurrencyTextField.text else { return }
        guard let amount = Double(amountString) else {
            print("Invalid amount")
            return
        }
        let output: Double = round(100 * convert(amount)) / 100
        
        let currencyFormatter: NumberFormatter = {
            let formatter = NumberFormatter()
            formatter.numberStyle = .currency
            return formatter
        }()
        
        toCurrencyTextField.text = "\(currencyFormatter.string(from: NSNumber(value: output))!)"
    }
    
    // step 3
    @IBAction func cadButtonTapped(_ sender: UIButton) {
        cadButton.isSelected.toggle()
        mxnButton.isSelected.toggle()
        if cadButton.isSelected {
            currency = .cad
            toCurrencyLabel.text = "Currency (CAD)"
        }
    }
    
    // step 4
    @IBAction func mxnButtonTapped(_ sender: UIButton) {
        // Select mxn
        cadButton.isSelected.toggle()
        mxnButton.isSelected.toggle()
        if mxnButton.isSelected {
            currency = .mxn
            toCurrencyLabel.text = "Currency (MXN)"
        }
    }
    
    // MARK: - Helper Methods
    // step 5 & 6
    func convert(_ dollars: Double) -> Double {
        var out = dollars
        if currency == .cad {
            out *= 1.31
        } else {
            out *= 18.77
        }
        return out
    }
}


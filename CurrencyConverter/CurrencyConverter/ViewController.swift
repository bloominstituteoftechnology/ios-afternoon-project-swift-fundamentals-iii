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

class ViewController: UIViewController {
    
    // MARK: - Outlets/Properties
    
    @IBOutlet weak var fromCurrencyTextField: UITextField!
    @IBOutlet weak var toCurrencyTextField: UITextField!
    
    @IBOutlet weak var toCurrencyLabel: UILabel!
    
    @IBOutlet weak var cadButton: UIButton!
    @IBOutlet weak var mxnButton: UIButton!
    
    var currency: Currency = .cad

    // MARK: - Actions
    
    // Test comment
    @IBAction func convertButtonTapped(_ sender: UIButton) {
    
        guard let input = fromCurrencyTextField.text else {return}
        if let unwrappedInput = Double(input) {
            //toCurrencyTextField.text = "$\(convert(unwrappedInput))"
            let currencyFormatter: NumberFormatter = {
                let formatter = NumberFormatter()
                formatter.numberStyle = .currency
                return formatter
            }()
            //print(currencyFormatter.string(from: NSNumber(value: convert(unwrappedInput))))
            if let unwrappedFormattedCurrency = currencyFormatter.string(from: NSNumber(value: convert(unwrappedInput))) {
                toCurrencyTextField.text = unwrappedFormattedCurrency
            }
        }
        
    }
    
    @IBAction func cadButtonTapped(_ sender: UIButton) {
        cadButton.isSelected.toggle()
        mxnButton.isSelected.toggle()
        toCurrencyLabel.text = "Currency (CAD)"
        self.currency = .cad
    }
    
    @IBAction func mxnButtonTapped(_ sender: UIButton) {
        cadButton.isSelected.toggle()
        mxnButton.isSelected.toggle()
        toCurrencyLabel.text = "Currency (MXN)"
        self.currency = .mxn
    }
    
    // MARK: - Helper Methods
    func convert(_ dollars: Double) -> Double {
        if self.currency == .cad {
            return dollars * 1.33
        }
        else {
            return dollars * 19.70
        }
    }
    
}


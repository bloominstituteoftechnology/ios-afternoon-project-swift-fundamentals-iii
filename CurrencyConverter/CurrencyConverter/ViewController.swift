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
    
    var currency: Currency = .cad
    var currencyFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        return formatter
    }()
    
    @IBOutlet weak var fromCurrencyTextField: UITextField!
    @IBOutlet weak var toCurrencyTextField: UITextField!
    
    @IBOutlet weak var toCurrencyLabel: UILabel!
    
    @IBOutlet weak var cadButton: UIButton!
    @IBOutlet weak var mxnButton: UIButton!

    // MARK: - Actions
    
    @IBAction func convertButtonTapped(_ sender: UIButton) {
        guard let convertedInput = Double(fromCurrencyTextField.text!) else { return }
        let convertedMoney = convert(convertedInput)
        toCurrencyTextField.text = currencyFormatter.string(from: NSNumber(value: convertedMoney))
        
        
    }
    
    @IBAction func cadButtonTapped(_ sender: UIButton) {
        handleToCurrencySelection()
        
        if sender.isSelected {
            currency = .cad
            toCurrencyLabel.text = "Currency(CAD)"
        }
        
        
    }
    
    @IBAction func mxnButtonTapped(_ sender: UIButton) {
        handleToCurrencySelection()
        if sender.isSelected {
            currency = .mxn
            toCurrencyLabel.text = "Currency(MXN)"
        }
        
    }
    
    // MARK: - Helper Methods
    func convert(_ dollars: Double) -> Double {
        switch currency {
            case .cad:
                return dollars * 1.33
            case .mxn:
                return dollars * 19.70
        }
    }
    
    func handleToCurrencySelection() {
        mxnButton.isSelected.toggle()
        cadButton.isSelected.toggle()
        toCurrencyTextField.text = ""
        
    }
}


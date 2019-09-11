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
        guard let userInput: Double = Double(fromCurrencyTextField.text ?? "0"), userInput >= 0 else { return }
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        
        if let formattedAmount = formatter.string(from: convert(userInput) as NSNumber) {
            if mxnButton.isSelected == true {
                formatter.locale = Locale(identifier: "es_MX")
            } else {
                formatter.locale = Locale.current
            }
            toCurrencyTextField.text = formattedAmount
        }
    }
    
    @IBAction func cadButtonTapped(_ sender: UIButton) {
        cadButton.isSelected = true
        mxnButton.isSelected = false
        if cadButton.isSelected == true {
            currency = .cad
            toCurrencyLabel.text = "Currrency (CAD)"
        }
        
        if fromCurrencyTextField.text == fromCurrencyTextField.text {
            guard let userInput: Double = Double(fromCurrencyTextField.text ?? "0"), userInput >= 0 else { return }
            let formatter = NumberFormatter()
            formatter.locale = Locale.current
            formatter.numberStyle = .currency
        
            if let formattedAmount = formatter.string(from: convert(userInput) as NSNumber) {
            toCurrencyTextField.text = formattedAmount
            }
        }
    }
    
    @IBAction func mxnButtonTapped(_ sender: UIButton) {
        cadButton.isSelected = false
        mxnButton.isSelected = true
        if mxnButton.isSelected == true {
            currency = .mxn
            toCurrencyLabel.text = "Currrency (MXN)"
            toCurrencyTextField.text = ""
            
        }
        if fromCurrencyTextField.text == fromCurrencyTextField.text {
            guard let userInput: Double = Double(fromCurrencyTextField.text ?? "0"), userInput >= 0 else { return }
            let formatter = NumberFormatter()
            formatter.locale = Locale(identifier: "es_MX")
            formatter.numberStyle = .currency
            
            if let formattedAmount = formatter.string(from: convert(userInput) as NSNumber) {
                toCurrencyTextField.text = formattedAmount
            }
        }
    }
    
    // MARK: - Helper Methods
    func convert(_ dollars: Double) -> Double {
        var totalCash: Double = 0
        switch currency {
        case .cad:
            if dollars >= 0 {
                totalCash = Double(dollars) * 1.31
            }
            
        case .mxn:
            if dollars >= 0 {
                totalCash = Double(dollars) * 19.5        }
    }
        return totalCash
}
    
    
    
}

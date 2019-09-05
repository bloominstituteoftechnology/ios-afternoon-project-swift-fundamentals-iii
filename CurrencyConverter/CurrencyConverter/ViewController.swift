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

var currencyFormatter: NumberFormatter = {
    let formatter = NumberFormatter()
    formatter.numberStyle = .currency
    return formatter
}()

class ViewController: UIViewController {
    
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
        
        guard let dollar = Double(fromCurrencyString) else {
            print("Invalid number")
            return
        }
        
        toCurrencyTextField.text = currencyFormatter.string(from:NSNumber(value: convert(dollar)))
        
    }
    
    @IBAction func cadButtonTapped(_ sender: UIButton) {
        sender.isSelected.toggle()
        mxnButton.isSelected.toggle()
        if cadButton.isSelected {
            currency = .cad
            toCurrencyLabel.text = "Currency (CAD)"
        } else {
            currency = .mxn
            toCurrencyLabel.text = "Currency (MXN)"
        }
        
        // convert automatically when switched betwwen CAD and MXN
        convertButtonTapped(sender)
    }
    
    @IBAction func mxnButtonTapped(_ sender: UIButton) {
        sender.isSelected.toggle()
        cadButton.isSelected.toggle()
        if mxnButton.isSelected {
            currency = .mxn
            toCurrencyLabel.text = "Currency (MXN)"
        } else {
            currency = .cad
            toCurrencyLabel.text = "Currency (CAD)"
        }
        
        // convert automatically when switched betwwen CAD and MXN
        convertButtonTapped(sender)
    }
    
    // MARK: - Helper Methods
    func convert(_ dollars: Double) -> Double {
        let convertedMoney: Double
        
        if currency == Currency.cad {
            convertedMoney = dollars * 1.33
        } else {
            convertedMoney = dollars * 19.7
        }
        
        return convertedMoney
    }
    
}


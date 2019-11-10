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

var currency = Currency.cad

class ViewController: UIViewController {
    
    // MARK: - Outlets/Properties
    
    @IBOutlet weak var fromCurrencyTextField: UITextField!
    @IBOutlet weak var toCurrencyTextField: UITextField!
    
    @IBOutlet weak var toCurrencyLabel: UILabel!
    
    @IBOutlet weak var convertButton: UIButton!
    @IBOutlet weak var cadButton: UIButton!
    @IBOutlet weak var mxnButton: UIButton!

    // MARK: - Actions
    
    
    @IBAction func convertButtonTapped(_ sender: UIButton) {
    }
    @IBAction func mxnButtonTapped(_ sender: UIButton) {
        
        guard let fromCurrencyString = fromCurrencyTextField.text else { return }
        
        guard let toCurrencyString = toCurrencyTextField.text else { return }
        
        guard let amountEntered = Double(fromCurrencyString),
            let amountEntered2 = Double(toCurrencyString) else {
                print("Invalid number")
                return
        }
        var amountToConvert: Double
        
        if mxnButton.isSelected {
            var mxCurrency = Currency.mxn
            mxnButton.isSelected = true
            cadButton.isSelected = false
            print("\(toCurrencyLabel) Currency (MXN)")
        }
    }
    @IBAction func cadButtonTapped(_ sender: UIButton) {
        guard let fromCurrencyString = fromCurrencyTextField.text else { return }
        
        guard let toCurrencyString = toCurrencyTextField.text else { return }
        
        guard let amountEntered = Double(fromCurrencyString),
            let amountEntered2 = Double(toCurrencyString) else {
                print("Invalid number")
                return
        }
        
        var amountToConvert: Double
        
        if cadButton.isSelected {
            var cadCurrency = Currency.cad
            cadButton.isSelected = true
            mxnButton.isSelected = false
            print("\(toCurrencyLabel) Currency (CAD)")
            
        }
   
    }
    
    // MARK: - Helper Methods
    
    func convert(_dollars: Double) -> Double {
        let cadDollar = Double(1.32)
        let usDollar = Double(1.00)
        let mxnPeso = Double(19.10)
    
        if cadButton.isSelected == true  {
        let amountEntered2 = usDollar * cadDollar
            
        } else {
            mxnButton.isSelected == true
            var amountEntered2 = usDollar * mxnPeso
        }
    }
    return convertedAmount

}



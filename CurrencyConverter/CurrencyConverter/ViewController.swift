//
//  ViewController.swift
//  CurrencyConverter
//
//  Created by Ben Gohlke on 8/7/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

enum Currency: Double {
    case cad = 1.30
    case mxn = 18.81
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
        guard let text = fromCurrencyTextField.text,
        let doubleAmount = Double(text) else{
           return
        }
        
        let converTotal = doubleAmount * currency.rawValue
        
        let currencyFormatter = NumberFormatter()
        currencyFormatter.usesGroupingSeparator = true
        currencyFormatter.numberStyle = .currency
        currencyFormatter.locale = Locale.current
        
        guard let formatedTotal = currencyFormatter.string(from: NSNumber(value: converTotal)) else {
            return
        }
        
        toCurrencyTextField.text = formatedTotal

    }
    
    @IBAction func cadButtonTapped(_ sender: UIButton) {
        if cadButton.isSelected == true {
              return
            }
        cadButton.isSelected = true
        mxnButton.isSelected = false
        
        if cadButton.isSelected == true{
            currency = .cad}
    }
    
    @IBAction func mxnButtonTapped(_ sender: UIButton) {
         if mxnButton.isSelected == true {
                     return
                   }
            mxnButton.isSelected = true
        cadButton.isSelected = false
        
        if mxnButton.isSelected == true{
        currency = .mxn}
    }
    
    // MARK: - Helper Methods
    
    func convert(_ dollars: Double) -> Double{
        let convertTotal = dollars * currency.rawValue
        print(convertTotal)
        return convertTotal
    }
}


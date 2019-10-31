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
    
    var currency = Currency.cad

    // MARK: - Actions
    
    @IBAction func convertButtonTapped(_ sender: UIButton) {
        
    }
    
    @IBAction func cadButtonTapped(_ sender: UIButton) {
        cadButton.isSelected = !cadButton.isSelected
        if cadButton.isSelected == true {
            currency = .cad
            mxnButton.isSelected = false
        }
        toCurrencyLabel.text = "Currency (CAD)"
    }
    
    @IBAction func mxnButtonTapped(_ sender: UIButton) {
        mxnButton.isSelected = !mxnButton.isSelected
        if mxnButton.isSelected == true {
            currency = .mxn
            cadButton.isSelected = false
            }
        toCurrencyLabel.text = "Currency (MXN)"
        }
    
    // MARK: - Helper Methods
func convert(_ dollars: Double) -> Double {
    let convertedValue: Double
    
    if currency == Currency.cad {
        convertedValue = dollars * 1.33
    } else {
        convertedValue = dollars * 19.70
    }
    return convertedValue
    }
}

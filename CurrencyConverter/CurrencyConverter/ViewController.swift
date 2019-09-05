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
        
        guard let currencyLabelString = toCurrencyLabel.text else {
            return
        }
        guard let fromCurrency = Double(currencyLabelString) else {
            print("N/A")
            return
        }
        
    }
    
    
    @IBAction func cadButtonTapped(_ sender: UIButton) {
        sender.isSelected.toggle()
        
        if cadButton.isSelected {
            currency = .cad
            toCurrencyLabel.text = "Currency (CAD)"
        } else {
            currency = .mxn
            toCurrencyLabel.text = "Currency (MXN)"
        }
        
            
    }
    
    @IBAction func mxnButtonTapped(_ sender: UIButton) {
        sender.isSelected.toggle()
        
        if cadButton.isSelected {

    }
    
    // MARK: - Helper Methods

    func convert(_ dollars: Double) -> Double {
        
    }
    
    
    }
}
//test

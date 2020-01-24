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
    
    @IBAction func convertButtonTapped(_ sender: UIButton) {
        
    }
    
    @IBAction func cadButtonTapped(_ sender: UIButton) {
        // Select cad
        if !cadButton.isSelected {
            cadButton.isSelected = true
            currency = .cad
            toCurrencyLabel.text = "Currency (CAD)"
        }
        
        // Deselect mxn
        mxnButton.isSelected = false
    }
    
    @IBAction func mxnButtonTapped(_ sender: UIButton) {
        // Select mxn
        if !mxnButton.isSelected {
            mxnButton.isSelected = true
            currency = .mxn
            toCurrencyLabel.text = "Currency (MXN)"
        }
        // Deselect cad
        cadButton.isSelected = false
    }
    
    // MARK: - Helper Methods
}


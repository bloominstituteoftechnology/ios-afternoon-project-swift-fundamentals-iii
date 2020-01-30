//
//  ViewController.swift
//  CurrencyConverter
//
//  Created by Ben Gohlke on 8/7/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

enum Currency {
    case CAD
    case MXN
}

var currency: Currency = .CAD

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
        let button = sender
        button.isSelected.toggle()
        if button.isSelected == true {
            currency = .CAD
        }
    }
    
    
    @IBAction func mxnButtonTapped(_ sender: UIButton) {
        let button = sender
        button.isSelected.toggle()
        if button.isSelected == true {
            currency = .MXN
        }
    }
    
    // MARK: - Helper Methods
}


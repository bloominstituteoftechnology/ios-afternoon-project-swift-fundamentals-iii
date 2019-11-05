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
    
    @IBAction func convertButtonTapped(_ sender: UIButton) {
        
        guard let fromCurrencyString = fromCurrencyTextField.text
            else { return }
        guard Double(fromCurrencyString) != nil
            else {
            print("Invalid number. Unable to initialize a double from the string.")
            return
        }
    }
    
    @IBAction func cadButtonTapped(_ sender: UIButton) {
        cadButton.isSelected.toggle()
        mxnButton.isSelected.toggle()
        var currency:  Currency = .cad
        
        }
    
    @IBAction func mxnButtonTapped(_ sender: UIButton) {
         mxnButton.isSelected.toggle()
         cadButton.isSelected.toggle()
        
        }
    
    // MARK: - Helper Methods



    func convertToCad(amount: Double) -> Double {
        var currency: Double
        
        if cadButton.isSelected {
            currency * 1.32
        } else {
            currency * 19.23
        }
    }
}

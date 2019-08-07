//
//  ViewController.swift
//  CurrencyConverter
//
//  Created by Ben Gohlke on 8/7/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Outlets/Properties
    
    @IBOutlet weak var fromCurrencyTextField: UITextField!
    @IBOutlet weak var toCurrencyTextField: UITextField!
    
    @IBOutlet weak var toCurrencyLabel: UILabel!
    
    @IBOutlet weak var cadButton: UIButton!
    @IBOutlet weak var mxnButton: UIButton!

    var currency = Currency()
    // MARK: - Actions
    
    @IBAction func convertButtonTapped(_ sender: UIButton) {
        guard let usCurrencyString = fromCurrencyTextField.text,
            let usCurrency = Double(usCurrencyString) else {return}
        if cadButton.isSelected {
          toCurrencyTextField.text = "\(currency.ConvertToCAD(from: usCurrency, to: .CAD))"
        } else if mxnButton.isSelected {
            toCurrencyTextField.text = "\(currency.convertToPeso(from: usCurrency, to: .MXPeso))"
           
        }
    }
    
    @IBAction func cadButtonTapped(_ sender: UIButton) {
        toCurrencyLabel.text = "Currency (CAD)"
         cadButton.isSelected.toggle()
        mxnButton.isSelected.toggle()
    
    }
    
    @IBAction func mxnButtonTapped(_ sender: UIButton) {
        toCurrencyLabel.text = "Currency (Peso)"
        mxnButton.isSelected.toggle()
        cadButton.isSelected.toggle()
    }
    
    // MARK: - Helper Methods
}


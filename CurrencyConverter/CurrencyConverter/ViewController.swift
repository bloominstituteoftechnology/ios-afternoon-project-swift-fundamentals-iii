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
        
        guard let dollarString = fromCurrencyTextField.text else { return }
        
        guard let dollars = Double(dollarString) else {
                print("Invalid number. Unable to initialize a double from the string.")
                return
            }
       // var currencyConverted: Double
        let dollarsConverted = convert(dollars: dollars)
        
        
            
        toCurrencyTextField.text = "\(dollarsConverted)"
            
           
    }
    
    @IBAction func cadButtonTapped(_ sender: UIButton) {
        cadButton.isSelected.toggle()
        mxnButton.isSelected = false
        mxnButton.isSelected.toggle()
        
        if cadButton.isSelected == true {
            var _: Currency = .cad
            toCurrencyLabel.text = "Currency (CAD)"
            
  //          toCurrencyLabel.display("Currency (CAD)")
        }

    }
    
    @IBAction func mxnButtonTapped(_ sender: UIButton) {
        cadButton.isSelected.toggle()
        cadButton.isSelected = false
        mxnButton.isSelected.toggle()
        
        if mxnButton.isSelected == true {
                   var _: Currency = .mxn
            toCurrencyLabel.text = "Currency (MXN)"
               }

    }
    
    // MARK: - Helper Methods

    //mmm
func convert( dollars: Double) -> Double {
    var currencyConverted: Double
        
    if cadButton.isSelected == true {
        currencyConverted = dollars * 1.32
        return currencyConverted
        }
        else {
        currencyConverted = dollars * 19.23
        }
        return currencyConverted
    }
}

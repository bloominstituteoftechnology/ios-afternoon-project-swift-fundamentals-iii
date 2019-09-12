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

//let currency = Currency.cad

class ViewController: UIViewController {
    
    var currency: Currency = Currency.cad
    
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
        
        guard let currencyUSD = Double(fromCurrencyString) else {
            print("Not a valid number")
            return
        }
        
        
        guard let conversion = convert(dollars: currencyUSD) else {
          toCurrencyTextField.text =
        }
        
//        let canadianDollars = currencyReturnInCAD(USD: currencyUSD)
//        toCurrencyTextField.text = "\(canadianDollars) CAD"
    }
    
    
    
    @IBAction func cadButtonTapped(_ sender: Any) {
        
        if cadButton.isSelected == true {
            toCurrencyLabel.text = "Currency (CAD)"
        }
        
        mxnButton.isSelected = false
        
        currency = Currency.cad
        
        
    }
   
    
    @IBAction func mxnButtonTapped(_ sender: UIButton) {
        
        cadButton.isSelected = false
        
        mxnButton.isSelected = true
        
        currency = Currency.mxn
        
        toCurrencyLabel.text = "Currency (MXN)"
    }

        
    
    
    // MARK: - Helper Methods //Functions
    
    func convert(dollars: Double) -> Double {
        var conversion: Double
        
        if currency == Currency.cad {
            conversion = dollars * 1.33
            return conversion
        } else {
                conversion = dollars * 19.7
                return conversion
            }
        }
    
    
    //    func currencyReturnInCAD(USD: Double) -> Double { // func to go along my func convertButtonTapped when CAD currency is chosen
//        let canadianDollars = USD * 1.33
//        return canadianDollars
//    }
    
    
    
}


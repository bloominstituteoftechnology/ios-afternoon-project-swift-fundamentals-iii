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

let currency = Currency.cad

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
        
        let canadianDollars = currencyReturnInCAD(USD: currencyUSD)
        toCurrencyTextField.text = "\(canadianDollars) CAD"
    }
    
    
    
    @IBAction func cadButtonTapped(_ sender: Any) {
        guard let cadButton = sender as? UIButton else {
            return
        }
        
        guard let mxnButton = sender as? UIButton else {
            return
        }
        
        if let cadButton.isSelected == true {
            
        }
    }
   
    
    @IBAction func mxnButtonTapped(_ sender: UIButton) {
     
        }
        
    
    
    // MARK: - Helper Methods //Functions
    
    func currencyReturnInCAD(USD: Double) -> Double { // func to go along my func converButtonTapped when CAD currency is chosen
        let canadianDollars = USD * 1.31
        return canadianDollars
    }
    
}


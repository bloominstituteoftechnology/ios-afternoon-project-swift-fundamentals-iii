//
//  ViewController.swift
//  CurrencyConverter
//
//  Created by Ben Gohlke on 8/7/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

enum Currency: String{
    case cad = "CAD"
    case mxn = "MXN"
}

class ViewController: UIViewController {
    var currency:Currency = .cad
    
    // MARK: - Outlets/Properties
    
    @IBOutlet weak var fromCurrencyTextField: UITextField!
    @IBOutlet weak var toCurrencyTextField: UITextField!
    
    @IBOutlet weak var toCurrencyLabel: UILabel!
    
    @IBOutlet weak var cadButton: UIButton!
    @IBOutlet weak var mxnButton: UIButton!

    // MARK: - Actions
    
    @IBAction func convertButtonTapped(_ sender: UIButton)  {
        
       
        guard let capture = fromCurrencyTextField.text else{return}
        let captureInput = Double(capture) ?? 0.0
       
        toCurrencyTextField.text = String(convert(captureInput))
            
        }
    
       
        
        

    
    @IBAction func cadButtonTapped(_ sender: UIButton) {
        cadButton.isSelected.toggle()
        mxnButton.isSelected = false
        if cadButton.isSelected{
            toCurrencyLabel.text = "Currency(CAD)"
            currency = .cad
    
        }}
        
            
        
        
        

    
    @IBAction func mxnButtonTapped(_ sender: UIButton) {
        mxnButton.isSelected.toggle()
        
        cadButton.isSelected = false
        if mxnButton.isSelected{
            toCurrencyLabel.text = "Currency(MXN)"
            currency = .mxn
        }
        }
        
        
        
    

    
    // MARK: - Helper Methods
func convert(_ dollars:Double) -> Double {
    var currencyConverted: Double
    
    if cadButton.isSelected == true{
        currencyConverted = dollars * 1.32
        return currencyConverted
    } else {
        currencyConverted = dollars * 19.23
    }
    return currencyConverted
    
}
}

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
    enum Currency {
        case cad
        case mxn
       
    }
    
    var currency:Currency = .cad
    
    @IBOutlet weak var fromCurrencyTextField: UITextField!
    @IBOutlet weak var toCurrencyTextField: UITextField!
    
    @IBOutlet weak var toCurrencyLabel: UILabel!
    
    @IBOutlet weak var cadButton: UIButton!
    @IBOutlet weak var mxnButton: UIButton!

    // MARK: - Actions
    
    @IBAction func convertButtonTapped(_ sender: UIButton) {
        
        var val : Double = 0
        guard let s_str = fromCurrencyTextField.text else {
            return
        }
       
        guard let s = Double(s_str) else {
            return
        }
        
        val  = convert(s)
       
        toCurrencyTextField.text = ("\(val)")
        
    }
    
    @IBAction func cadButtonTapped(_ sender: UIButton) {
        sender.isSelected.toggle()
         mxnButton.isSelected.toggle()
        
        if sender.isSelected {
            currency = .cad
            toCurrencyLabel.text = "Cureency CAD"
        }
       
        
        
    }
    
    @IBAction func mxnButtonTapped(_ sender: UIButton) {
        sender.isSelected.toggle()
        cadButton.isSelected.toggle()
        
        if sender.isSelected {
            currency = .mxn
            toCurrencyLabel.text = "Cureency MXN"
        }
        
    }
            
    
    
    // MARK: - Helper Methods
    
    func convert(_ dollars : Double)-> Double {
        
        var result : Double = 0
        if currency == Currency.cad {
            
            result = dollars * 1.33
        }
        else if currency == Currency.mxn {
            
            result = dollars * 19.70
        }
        
        return result
        
    }
}


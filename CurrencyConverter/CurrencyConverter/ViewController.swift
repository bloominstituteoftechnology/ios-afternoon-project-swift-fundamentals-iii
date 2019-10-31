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
var currency = Currency.cad





class ViewController: UIViewController {
    
    // MARK: - Outlets/Properties
    
    @IBOutlet weak var fromCurrencyTextField: UITextField!
    @IBOutlet weak var toCurrencyTextField: UITextField!
    
    @IBOutlet weak var toCurrencyLabel: UILabel!
    
    @IBOutlet weak var cadButton: UIButton!
    @IBOutlet weak var mxnButton: UIButton!

    // MARK: - Actions
    
    @IBAction func convertButtonTapped(_ sender: UIButton) {
        guard let
        
    }
    
    @IBAction func cadButtonTapped(_ sender: UIButton) {
        cadButton.isSelected.toggle()
        
        toCurrencyLabel.text = "Currency (CAD)"
        
            
        }
        
    
    
    @IBAction func mxnButtonTapped(_ sender: UIButton) {
        mxnButton.isSelected.toggle()
        
        toCurrencyLabel.text = "Currency (MXN)"
        
        
    }


    
    // MARK: - Helper Methods
}
func convertCad(_ dollars: Double) -> Double {
    let cad = dollars * 1.33
    return cad
}

func convertMXN(_ dollars: Double) -> Double {
    let mxn = dollars * 19.24
    return mxn
}
    func convert(_ dollars: Double) -> Double {
        if currency == Currency.cad {
            return convertCad(dollars)
        } else {
            return convertMXN(dollars)
        
        }
    }


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
        guard let button = sender as? UIButton else { return }
        
        button.isSelected.toggle()
        
        
    }
    
    @IBAction func cadButtonTapped(_ sender: UIButton) {
        guard let button = sender as? UIButton else { return }
        button.isSelected.toggle()
        
        guard fromCurrencyTextField.text != nil else {return}
        
        guard let cadCurrencyRate = Double(fromCurrencyTextField.text) else {
            print("invalid number")
            return
        }
        
        if cadButton.isSelected {
            cadCurrencyRate = dollars * 1.32

        } else {
            
        }
        
        toCurrencyTextField.text = "\(currency) (CAD)"
    }
    
    @IBAction func mxnButtonTapped(_ sender: UIButton) {
        guard let button = sender as? UIButton else { return }
        guard let <#constant#> = <#expression#> else { return <#return value#> }
        button.isSelected.toggle()
        
        if mxnButton.isSelected {
            currency =
        } else {
            
        }
        toCurrencyTextField.text = "\(currency) (MXN)"
    }
    
    // MARK: - Helper Methods
    func convert(_ dollars: Double) -> Double {
       
        let conversion: Double = dollars *
        return conversion
        
    }
}


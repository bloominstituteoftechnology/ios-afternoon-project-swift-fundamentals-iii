//
//  ViewController.swift
//  CurrencyConverter
//
//  Created by Ben Gohlke on 8/7/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

enum Currency: Double
{
    case cad = 1.33
    case mxn = 19.29
}

class ViewController: UIViewController
{
    
    var currency: Currency? = .cad
    
    // MARK: - Outlets/Properties
    
    @IBOutlet weak var fromCurrencyTextField: UITextField!
    @IBOutlet weak var toCurrencyTextField: UITextField!
    
    @IBOutlet weak var toCurrencyLabel: UILabel!
    
    @IBOutlet weak var cadButton: UIButton!
    @IBOutlet weak var mxnButton: UIButton!

    // MARK: - Actions
    
    @IBAction func convertButtonTapped(_ sender: UIButton)
    {
        guard let usdcurrencyString = fromCurrencyTextField.text else {return}
        guard let currentCurrency = Double(usdcurrencyString) else {return}
        
        if cadButton.isSelected
        {
            convert(currentCurrency)
        }
        else
        {
            convert(currentCurrency)
        }
    }
    
    @IBAction func cadButtonTapped(_ sender: UIButton)
    {
        cadButton.isSelected = !cadButton.isSelected
        if cadButton.isSelected == true
        {
            mxnButton.isSelected = false
            currency = .cad
            toCurrencyLabel.text = "Currency (CAD)"
        }
    }
    
    @IBAction func mxnButtonTapped(_ sender: UIButton)
    {
        mxnButton.isSelected = !mxnButton.isSelected
        if mxnButton.isSelected == true
        {
            cadButton.isSelected = false
            currency = .mxn
            toCurrencyLabel.text = "Currency (MXN)"
            
        }
        
        
    }
    
    // MARK: - Helper Methods
    func convert(_ dollars: Double) -> Double
    {
        switch currency
        {
        case .cad:
            return dollars * Currency.cad.rawValue
        case .mxn:
            return dollars * Currency.mxn.rawValue
        default:
            return 0
        }
    }
}


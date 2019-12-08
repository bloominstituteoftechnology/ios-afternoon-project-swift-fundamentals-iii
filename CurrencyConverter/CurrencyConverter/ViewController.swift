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
        
    }
    
    @IBAction func cadButtonTapped(_ sender: UIButton)
    {
        cadButton.isSelected.toggle()
        if cadButton.isSelected == true
        {
            mxnButton.isSelected = false
            currency = .cad
            toCurrencyLabel.text = "Currency (CAD)"
        }
    }
    
    @IBAction func mxnButtonTapped(_ sender: UIButton)
    {
        mxnButton.isSelected.toggle()
        if mxnButton.isSelected == true
        {
            cadButton.isSelected = false
            currency = .mxn
            toCurrencyLabel.text = "Currency (MXN)"
            
        }
        
        
    }
    
    // MARK: - Helper Methods
    
    
}


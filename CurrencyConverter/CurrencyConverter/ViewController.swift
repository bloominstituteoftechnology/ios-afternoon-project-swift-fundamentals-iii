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
    
    @IBAction func convertButtonTapped(_ sender: UIButton) {
        
    }
    
    @IBAction func cadButtonTapped(_ sender: UIButton) {
        cadButton.isSelected.toggle()
        mxnButton.isSelected = false
        if cadButton.isSelected{
            toCurrencyLabel.text = "Currency(CAD)"
    
        }}
        
            
        
        
        

    
    @IBAction func mxnButtonTapped(_ sender: UIButton) {
        mxnButton.isSelected.toggle()
        
        cadButton.isSelected = false
        if mxnButton.isSelected{
            toCurrencyLabel.text = "Currency(MXN)"
        }
        }
        }
        
        
    

    // MARK: - Helper Methods



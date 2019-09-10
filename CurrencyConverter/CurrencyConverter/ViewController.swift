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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // MARK: - Helper Methods
    
    func convert(_ dollars: Double) -> Double {
        
    }

    // MARK: - Actions
    
    @IBAction func convertButtonTapped(_ sender: UIButton) {
        
    }
    
    @IBAction func cadButtonTapped(_ sender: UIButton) {
        sender.isSelected.toggle()
    
        if sender.isSelected {
            mxnButton.isSelected = false
            currency = .cad
            toCurrencyLabel.text = "Currency (CAD)"
        } else {
            mxnButton.isSelected = true
            currency = .mxn
            toCurrencyLabel.text = "Currency (MXN)"
        }
    }
    
    @IBAction func mxnButtonTapped(_ sender: UIButton) {
        sender.isSelected.toggle()
        
        if sender.isSelected {
            cadButton.isSelected = false
            currency = .mxn
            toCurrencyLabel.text = "Currency (MXN)"
        } else {
            cadButton.isSelected = true
            currency = .cad
            toCurrencyLabel.text = "Currency (CAD)"
        }
    }
    
    
}


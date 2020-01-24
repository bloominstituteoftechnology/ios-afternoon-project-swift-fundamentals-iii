//
//  ViewController.swift
//  CurrencyConverter
//
//  Created by Ben Gohlke on 8/7/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

/////////////////////////////
//
//   I added a couple other features: the screen color change
// and made it so either CAD or Peso buttons enacted the calculating
//
//   I am not sure if it is a bug, but the converted value does not conform
// to the numberStyle.currency designation from seemingly random numerical
// entries sending the result out 14 decimal places for me.
//

class ViewController: UIViewController {
    
    enum Currency {
        case cad
        case mxn
    }
    
    var currencyType: Currency = .cad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        toCurrencyTextField.isUserInteractionEnabled = false
        self.view.backgroundColor = UIColor.orange
    }
    
    // MARK: - Outlets/Properties
    
    @IBOutlet weak var fromCurrencyTextField: UITextField!
    @IBOutlet weak var toCurrencyTextField: UITextField!
    @IBOutlet weak var toCurrencyLabel: UILabel!
    @IBOutlet weak var cadButton: UIButton!
    @IBOutlet weak var mxnButton: UIButton!
    
    // MARK: - Actions
    
    @IBAction func convertButtonTapped(_ sender: UIButton) {
        
        convertTapped()
        
    }
    
    @IBAction func cadButtonTapped(_ sender: UIButton) {
        
        currencyType = .cad
        cadButton.isSelected = true
        mxnButton.isSelected = false
        toCurrencyLabel.text = "Currency(CAD)"
        convertTapped()
    }
    
    @IBAction func mxnButtonTapped(_ sender: UIButton) {
        
        currencyType = .mxn
        cadButton.isSelected = false
        mxnButton.isSelected = true
        toCurrencyLabel.text = "Currency(MXN)"
        convertTapped()
    }
    
    // MARK: - Helper Methods
    
    func convert(_ dollars: Double) -> Double {
        var money: Double
        // us to cad 1.31, us to mxn peso 18.77 as of 01/23/2020
        if currencyType == .cad {
            money = dollars * 1.31
        } else {
            money = dollars * 18.77
        }
        return money
    }
    
    // calculates the conversion when either CAD or MXN button is tapped :)
    
    func convertTapped() {
        guard let currencyText = fromCurrencyTextField.text,
            let currencyAmt = Double(currencyText)
            else { return }
        
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        switch currencyType {
        case .cad:
            formatter.currencyCode = "CAD"
        case .mxn:
            formatter.currencyCode = "MXN"
        }
        let convertedString = formatter.string(from: NSNumber(value: currencyAmt))
       
        toCurrencyTextField.text = convertedString
    }
}

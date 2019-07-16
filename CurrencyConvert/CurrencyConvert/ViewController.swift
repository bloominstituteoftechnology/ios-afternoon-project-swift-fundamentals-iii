//
//  ViewController.swift
//  CurrencyConvert
//
//  Created by Vici Shaweddy on 7/15/19.
//  Copyright © 2019 Vici Shaweddy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    enum CurrencyType {
        case cad
        case peso
    }
    
    var currencyType: CurrencyType = .cad
    
    @IBOutlet weak var fromCurrencyTextField: UITextField!
    @IBOutlet weak var toCurrencyTextField: UITextField!
    @IBOutlet weak var toCurrencyLabel: UILabel!
    @IBOutlet weak var cadButton: UIButton!
    @IBOutlet weak var pesoButton: UIButton!
    
    @IBAction func convertButtonPressed(_ sender: Any) {
        guard let inputString = fromCurrencyTextField.text, let inputDouble = Double(inputString) else { return }
        
        let convertNumber = self.convert(dollars: inputDouble, to: self.currencyType)
        
        toCurrencyTextField.text = String(convertNumber)
    
    }
    
    @IBAction func cadButtonPressed(_ sender: Any) {
        // activate the button, change the color
        self.cadButton.isSelected = true
        self.pesoButton.isSelected = false
        
        // set the label to CAD
        toCurrencyLabel.text = "Currency (CAD)"
        
        // change the currency type
        self.currencyType = .cad
        
        // call convert
        self.convertButtonPressed(self)
    }
    
    @IBAction func pesoButtonPressed(_ sender: Any) {
        // activate the button, change the color
        self.pesoButton.isSelected = true
        self.cadButton.isSelected = false
        
        // set the label to Peso
        toCurrencyLabel.text = "Currency (Peso)"
        
        // change the currency type
        self.currencyType = .peso
        
        // call convert
        self.convertButtonPressed(self)
    }
    

    
    func convert(dollars: Double, to unit: CurrencyType) -> Double {
        if unit == .cad {
            return 1.35 * dollars
        } else {
            return 19.78 * dollars
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //default
        self.cadButton.isSelected = true
    }


}


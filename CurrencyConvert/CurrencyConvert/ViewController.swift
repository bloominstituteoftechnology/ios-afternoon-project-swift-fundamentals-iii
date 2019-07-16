//
//  ViewController.swift
//  CurrencyConvert
//
//  Created by Vici Shaweddy on 7/15/19.
//  Copyright © 2019 Vici Shaweddy. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
    private enum CurrencyType {
        case cad
        case peso
    }
    
    private var currencyType = CurrencyType.cad {
        didSet {
            // call convert
            self.convertButtonPressed(self)
            
            // activate the button, change the color
            self.updateUI()
        }
    }
    
    @IBOutlet private weak var fromCurrencyTextField: UITextField!
    @IBOutlet private weak var toCurrencyTextField: UITextField!
    @IBOutlet private weak var toCurrencyLabel: UILabel!
    @IBOutlet private weak var cadButton: UIButton!
    @IBOutlet private weak var pesoButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //default
        self.updateUI()
    }
    
    @IBAction func convertButtonPressed(_ sender: Any) {
        guard let inputString = fromCurrencyTextField.text, let inputDouble = Double(inputString) else {
            return
        }

        let convertNumber = self.convert(dollars: inputDouble, to: self.currencyType)
        toCurrencyTextField.text = String(convertNumber)
    }
    
    @IBAction func cadButtonPressed(_ sender: Any) {
        // change the currency type
        self.currencyType = .cad
    }
    
    @IBAction func pesoButtonPressed(_ sender: Any) {
        // change the currency type
        self.currencyType = .peso
    }
    
    private func convert(dollars: Double, to unit: CurrencyType) -> Double {
        if unit == .cad {
            return 1.35 * dollars
        } else {
            return 19.78 * dollars
        }
    }
    
    private func updateUI() {
        switch self.currencyType {
        case .cad:
            self.cadButton.isSelected = true
            self.pesoButton.isSelected = false
            self.toCurrencyLabel.text = "Currency (CAD)"
        case .peso:
            self.pesoButton.isSelected = true
            self.cadButton.isSelected = false
            self.toCurrencyLabel.text = "Currency (Peso)"
        }
    }
}


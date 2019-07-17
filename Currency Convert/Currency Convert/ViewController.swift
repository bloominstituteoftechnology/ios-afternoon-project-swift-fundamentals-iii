//
//  ViewController.swift
//  TurkeyCalculator
//
//  Created by Casualty on 7/15/19.
//  Copyright © 2019 Casualty. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // Adding Outlets
    @IBOutlet weak var fromCurrencyTextField: UITextField!
    
    @IBOutlet weak var toCurrencyTextField: UITextField!

    @IBOutlet weak var convertButton: UIButton!
    
    @IBOutlet weak var appTitle: UILabel!
    
    @IBOutlet weak var toCurrencyLabel: UILabel!
    
    @IBOutlet weak var fromCurrencyLabel: UILabel!
    
    @IBOutlet weak var cadButton: UIButton!
    
    @IBOutlet weak var pesoButton: UIButton!
    
    
    // Create enum
    enum CurrencyType {
        case cad
        case peso
    }
    
    var currencyType: CurrencyType = .cad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setting cadButton.isSelected to true
        cadButton.isSelected = true
        view.backgroundColor = .darkGray
        toCurrencyLabel.textColor = .white
        fromCurrencyLabel.textColor = .white
        appTitle.textColor = .white
        convertButton.backgroundColor = .white
        convertButton.layer.cornerRadius = 5
    }

    @IBAction func convertButtonPressed(_ sender: Any) {
        guard let dollarsText = fromCurrencyTextField.text, let dollars = Double(dollarsText), dollars >= 0 else {
            toCurrencyTextField.text = "Invalid Number"
            return
        }
        
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
        formatter.locale = Locale(identifier: "en_US")
        toCurrencyTextField.text = formatter.string(for: convert(dollars: dollars, to: currencyType))
    }
    
    @IBAction func cadButtonPressed(_ sender: Any) {
        guard currencyType != .cad else { return }
        
        currencyType = .cad
        cadButton.isSelected = true
        pesoButton.isSelected = false
        convertButtonPressed((Any).self)
        toCurrencyLabel.text = "Currency (CAD)"
    }
    
    @IBAction func pesoButtonPressed(_ sender: Any) {
        guard currencyType != .peso else { return }
        
        currencyType = .peso
        cadButton.isSelected = false
        pesoButton.isSelected = true
        convertButtonPressed((Any).self)
        toCurrencyLabel.text = "Currency (Peso)"
    }

    
    func convert(dollars: Double, to unit: CurrencyType) -> Double {
        let pesoValue: Double = 19.78
        let cadValue: Double = 1.35
        let result: Double
        
        if unit == .peso {
            result = dollars * pesoValue
        } else {
            result = dollars * cadValue
        }
        
        return result
    }
}


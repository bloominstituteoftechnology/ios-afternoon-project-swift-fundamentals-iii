//
//  ViewController.swift
//  Currency Convert App
//
//  Created by Chris Gooley on 7/16/19.
//  Copyright © 2019 Chris Gooley. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
 
    // Create outlets
    @IBOutlet weak var fromCurrencyTextField: UITextField!
    @IBOutlet weak var toCurrencyTextField: UITextField!
    @IBOutlet weak var toCurrencyLabel: UILabel!
    @IBOutlet weak var cadButton: UIButton!
    @IBOutlet weak var pesoButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        cadButton.isSelected = true
        // Do any additional setup after loading the view.
    }

    // Create currency enum
    enum CurrencyType {
        case cad
        case peso
    }
    
    // Create variable to store what currencyType the app is in
    var currencyType = CurrencyType.cad
    
    var currencyFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        return formatter
    }()
    
    //Create actions
    @IBAction func convertButtonPressed(_ sender: Any) {
        guard let input = fromCurrencyTextField.text,
            let dollars = Double(input),
            dollars > 0
            else { return }
        
        let convertedDollars = convert(dollars: dollars, to: currencyType) as NSNumber
        let local = currencyType == CurrencyType.cad ? "en_CA" : "es_MX"
        
        currencyFormatter.locale = Locale(identifier: local)
        toCurrencyTextField.text = currencyFormatter.string(from: convertedDollars)
        
        
    }
    
    @IBAction func cadButtonPressed(_ sender: Any) {
        cadButton.isSelected = true
        pesoButton.isSelected = false
        currencyType = CurrencyType.cad
        toCurrencyLabel.text = "Currency (CAD)"
    }
    
    @IBAction func pesoButtonPessed(_ sender: Any) {
        cadButton.isSelected = false
        pesoButton.isSelected = true
        currencyType = CurrencyType.peso
        toCurrencyLabel.text = "Currency (MXN)"
    }

    // Create method to calculate currency
    func convert(dollars: Double, to unit: CurrencyType) -> Double {
        
        // Declare constants for exchange rates
        let cadRate: Double = 1.30
        let pesoRate: Double = 18.97
        
        // Switch statement for calculating exchange rate and returning the value to unit property, which is an instance of the currencyType enum (switch statements must be exhaustive)
        switch unit {
        case .cad:
            return dollars * cadRate
        case .peso:
            return dollars * pesoRate
        }
        
    }

}



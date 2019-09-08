//
//  ViewController.swift
//  FundamentalsIII- CurrencyConverter
//
//  Created by Joseph Rogers on 7/15/19.
//  Copyright © 2019 Joe Rogers. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var fromCurrencyTextField: UITextField!
    @IBOutlet weak var toCurrencyTextField: UITextField!
    @IBOutlet weak var toCurrencyLabel: UILabel!
    
    @IBOutlet weak var cadButton: UIButton!
    @IBOutlet weak var pseoButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currencyType = .cad
        cadButton.isSelected = true
        // Do any additional setup after loading the view.
    }
    
    
    var currencyType: CurrencyType?
    enum CurrencyType {
        case cad
        case peso
    }
    
    
    
    
    @IBAction func convertButtonPressed(_ sender: Any) {
        guard let dollars: Double = Double(fromCurrencyTextField.text!),
            let currencyType: CurrencyType = currencyType else {
                return }
        
        let currencyFormat = NumberFormatter()
        currencyFormat.numberStyle = .currency
        currencyFormat.locale = Locale(identifier: "en_US")
        
        toCurrencyTextField.text = currencyFormat.string(from: NSNumber(value: convert(dollars: dollars, to: currencyType)))
    }
    @IBAction func cadButtonPressed(_ sender: Any) {
        currencyType = .cad
        cadButton.isSelected = true
        pseoButton.isSelected = false
        toCurrencyLabel.text = "Currency (CAD)"
        toCurrencyTextField.text = ""
        convertButtonPressed(self)
    }
    @IBAction func pesoButtonPressed(_ sender: Any) {
        currencyType = .peso
        pseoButton.isSelected = true
        cadButton.isSelected = false
        toCurrencyLabel.text = "Currency (Peso)"
        toCurrencyTextField.text = ""
         convertButtonPressed(self)
    }


func convert(dollars: Double, to unit: CurrencyType) -> Double {
    let cadPrice: Double = 1.31
    let pesoPrice: Double = 19.10
    switch unit {
    case .cad:
        return dollars * cadPrice
    case .peso:
        return dollars * pesoPrice
    }
}
}

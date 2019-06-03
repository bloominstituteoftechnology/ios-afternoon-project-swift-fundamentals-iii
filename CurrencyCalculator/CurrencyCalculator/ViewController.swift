//
//  ViewController.swift
//  CurrencyCalculator
//
//  Created by Alex Shillingford on 6/3/19.
//  Copyright © 2019 Alex Shillingford. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var fromCurrencyTextField: UITextField!
    @IBOutlet weak var toCurrencyTextField: UITextField!
    @IBOutlet weak var toCurrencyLabel: UILabel!
    @IBOutlet weak var convertButton: UIButton!
    @IBOutlet weak var cadButton: UIButton!
    @IBOutlet weak var pesoButton: UIButton!
    
    var currencyType: CurrencyType = .cad
    
    var currencyFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        return formatter
    }()
    
    enum CurrencyType {
        case cad
        case peso
    }
    
    func convert(dollars: Double, to unit: CurrencyType) -> Double {
        let cad = dollars * 1.35
        let peso = dollars * 19.78
        var outcome: Double
        
        
        switch unit {
        case .peso:
            outcome = peso
        default:
            outcome = cad
        }
        
        return outcome
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cadButton.isSelected.toggle()
        pesoButton.isSelected = false
        view.backgroundColor = .darkText
        convertButton.layer.cornerRadius = 20.5
    }
    
    @IBAction func convertButtonPressed(_ sender: Any) {
        guard let userInput = fromCurrencyTextField.text else {
            toCurrencyTextField.text = "Invalid number entered"
            return
        }
        
        toCurrencyTextField.text = currencyFormatter.string(for: convert(dollars: Double(userInput) ?? 0.00, to: currencyType))
    }
    
    @IBAction func cadButtonPressed(_ sender: Any) {
        currencyType = .cad
        cadButton.isSelected.toggle()
        pesoButton.isSelected = false
        
        toCurrencyLabel.text = "Currency (CAD):"
    }
    
    @IBAction func pesoButtonPressed(_ sender: Any) {
        currencyType = .peso
        pesoButton.isSelected.toggle()
        cadButton.isSelected = false
        
        toCurrencyLabel.text = "Currency (Peso):"
        
    }
    


}


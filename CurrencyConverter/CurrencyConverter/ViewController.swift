//
//  ViewController.swift
//  CurrencyConverter
//
//  Created by Jessie Ann Griffin on 7/15/19.
//  Copyright © 2019 Jessie Griffin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: Properties
    @IBOutlet weak var fromCurrencyTextField: UITextField!
    @IBOutlet weak var toCurrencyTextField: UITextField!
    
    @IBOutlet weak var toCurrencyLabel: UILabel!
    
    @IBOutlet weak var cadButton: UIButton!
    @IBOutlet weak var pesoButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    enum CurrencyType {
        case cad
        case peso
    }

    @IBAction func convertButtonPressed(_ sender: Any) {
        
        let pesoFormatter: NumberFormatter = {
            let peso = NumberFormatter()
            peso.numberStyle = .currency
            peso.currencySymbol = "₱"
            return peso
        }()
        
        let cadFormatter: NumberFormatter = {
            let cad = NumberFormatter()
            cad.numberStyle = .currency
            return cad
        }()
        
        guard let currencyString = fromCurrencyTextField.text else { return }
        
        guard let currency = Double(currencyString) else {
            print("Invalid number")
            return
        }
        
        var currencyType: CurrencyType
        var toCurrency: Double
        
        if cadButton.isSelected {
            
            currencyType = .cad
            toCurrencyLabel.text = "Currency (CAD)"
            toCurrency = convert(dollars: currency, to: currencyType)
            toCurrencyTextField.text = cadFormatter.string(from: NSNumber(value: toCurrency))
            
        } else if pesoButton.isSelected {
            
            currencyType = .peso
            toCurrencyLabel.text = "Currency (Peso)"
            toCurrency = convert(dollars: currency, to: currencyType)
            //toCurrencyTextField.text = "\(toCurrency)"
            toCurrencyTextField.text = pesoFormatter.string(from: NSNumber(value: toCurrency))
        
        } else {
            
        }
    }
    
    @IBAction func cadButtonPressed(_ sender: Any) {
       
        guard let cadButton = sender as? UIButton else { return }
        cadButton.isSelected.toggle()
        pesoButton.isSelected = false
    }
    
    
    @IBAction func pesoButtonPressed(_ sender: Any) {
        
        guard let pesoButton = sender as? UIButton else { return }
        pesoButton.isSelected.toggle()
        cadButton.isSelected = false
        
    }
    
    func convert(dollars: Double, to unit: CurrencyType) -> Double {
        
        var toCurrency: Double
        
        switch unit {
        case .cad:
            toCurrency = dollars * 1.31
        case .peso:
            toCurrency = dollars * 19.09
        }
        
        return toCurrency
    }
    
}


//
//  ViewController.swift
//  CurrencyCovertApp
//
//  Created by Donella Barcelo on 8/7/19.
//  Copyright © 2019 Donella Barcelo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var fromCurrencyTextField: UITextField!
    @IBOutlet weak var toCurrencyTextField: UITextField!
    
    @IBOutlet weak var toCurrencyLabel: UILabel!
    
    @IBOutlet weak var cadButton: UIButton!
    @IBOutlet weak var pesoButton: UIButton!
    
    var currencyType = CurrencyType.cad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateViews()
    }
    
    func updateViews () {
        switch currencyType {
        case .cad:
            cadButton.isSelected = true
            pesoButton.isSelected = false
        case .peso:
            cadButton.isSelected = false
            pesoButton.isSelected = true
        }
    }
    
    @IBAction func convertButtonPressed(_ sender: UIButton) {
        guard let currencyUSString = fromCurrencyTextField.text,
            let currencyUS = Double(currencyUSString) else { return }
        
        let expectedCurrency = convert(dollars: currencyUS)
        
        toCurrencyTextField.text = "\(expectedCurrency)"
    }
    
    @IBAction func cadButtonPressed(_ sender: UIButton) {
        toCurrencyLabel.text = CurrencyType.cad.rawValue
        currencyType = .cad
        updateViews()
    }
    
    @IBAction func pesoButtonPressed(_ sender: UIButton) {
        toCurrencyLabel.text = CurrencyType.peso.rawValue
        currencyType = .peso
        updateViews()
    }
    
    enum CurrencyType: String {
        case cad = "Currency (CAD)"
        case peso = "Currency (MXN)"
    }
    
    func convert(dollars: Double) -> Double {
        let expectedCurrency: Double
        
        if currencyType == CurrencyType.cad {
            expectedCurrency = dollars * 1.35
        } else {
            expectedCurrency = dollars * 19.78
        }
        return expectedCurrency
    }
}

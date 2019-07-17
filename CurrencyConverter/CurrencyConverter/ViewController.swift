//
//  ViewController.swift
//  CurrencyConverter
//
//  Created by John Kouris on 7/15/19.
//  Copyright © 2019 John Kouris. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    enum CurrencyType {
        case cad
        case peso
    }
    
    // MARK: - Properties
    
    var currencyFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        return formatter
    }()
    
    @IBOutlet weak var fromCurrencyTextField: UITextField!
    @IBOutlet weak var toCurrencyTextField: UITextField!
    @IBOutlet weak var toCurrencyLabel: UILabel!
    @IBOutlet weak var cadButton: UIButton!
    @IBOutlet weak var pesoButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cadButton.isSelected = true
//        updateViews()
    }

    // MARK: - Action Methods
    
    @IBAction func convertButtonPressed(_ sender: Any) {
        guard let currencyString = fromCurrencyTextField.text, let currency = Double(currencyString) else { return }
        
        if cadButton.isSelected {
            toCurrencyLabel.text = "Currency (CAD)"
            toCurrencyTextField.text = String(convert(dollars: currency, to: .cad))
        } else if pesoButton.isSelected {
            toCurrencyLabel.text = "Currency (Peso)"
            toCurrencyTextField.text = String(convert(dollars: currency, to: .peso))
        }
    }
    
    @IBAction func cadButtonPressed(_ sender: Any) {
        guard let button = sender as? UIButton else { return }
        
        button.isSelected.toggle()
        
        pesoButton.isSelected = false
    }
    
    @IBAction func pesoButtonPressed(_ sender: Any) {
        guard let button = sender as? UIButton else { return }
        
        button.isSelected.toggle()
        
        cadButton.isSelected = false
    }
    
    // MARK: - Helper Methods
    
    // Convert the given US dollar value into either CAD or MXD
    func convert(dollars: Double, to unit: CurrencyType) -> String {
        var totalAmount = 0.0
        
        if unit == .cad {
            totalAmount = dollars * 1.31
        } else if unit == .peso {
            totalAmount = dollars * 18.98
        }
        
        if let formattedCurrencyTotal = currencyFormatter.string(from: NSNumber(value: totalAmount)) {
            return formattedCurrencyTotal
        } else {
            return ""
        }
    }
    
    func updateViews() {
        
        self.view.backgroundColor = Design.mainAppColor
        self.navigationController?.navigationBar.barTintColor = Design.mainAppColor
        
    }
}


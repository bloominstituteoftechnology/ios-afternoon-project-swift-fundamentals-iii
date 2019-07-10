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
    
    let colors = Colors()
    
    var currencyFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        return formatter
    }()
    
    enum CurrencyType {
        case cad
        case peso
    }
    
    func refresh() {
        view.backgroundColor = UIColor.clear
        let backgroundLayer = colors.gl
        backgroundLayer?.frame = view.frame
        view.layer.insertSublayer(backgroundLayer!, at: 0)
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
        
        fromCurrencyTextField.addTarget(self, action: #selector(myTextFieldDidChange), for: .editingChanged)
        refresh()
    }
    
    @objc func myTextFieldDidChange(_ textField: UITextField) {
        
        if let amountString = textField.text?.currencyInputFormatting() {
            textField.text = amountString
        }
    }
    
    
    @IBAction func convertButtonPressed(_ sender: Any) {
        
        
        guard let fromTextField = fromCurrencyTextField.text?.dropFirst(),
            let fromTextFieldConverted = Double(fromTextField) else {
            toCurrencyTextField.text = "Invalid number entered"
            return
        }
        
        toCurrencyTextField.text = currencyFormatter.string(for: convert(dollars: fromTextFieldConverted, to: currencyType))
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
        
        toCurrencyLabel.text = "Currency (MXN):"
        
    }
    
}

extension String {
    
    // formatting text for currency textField
    func currencyInputFormatting() -> String {
        
        var number: NSNumber!
        let formatter = NumberFormatter()
        formatter.numberStyle = .currencyAccounting
        formatter.currencySymbol = "$"
        formatter.maximumFractionDigits = 2
        formatter.minimumFractionDigits = 2
        
        var amountWithPrefix = self
        
        // remove from String: "$", ".", ","
        let regex = try! NSRegularExpression(pattern: "[^0-9]", options: .caseInsensitive)
        amountWithPrefix = regex.stringByReplacingMatches(in: amountWithPrefix, options: NSRegularExpression.MatchingOptions(rawValue: 0), range: NSMakeRange(0, self.count), withTemplate: "")
        
        let double = (amountWithPrefix as NSString).doubleValue
        number = NSNumber(value: (double / 100))
        
        // if first number is 0 or all numbers were deleted
        guard number != 0 as NSNumber else {
            return ""
        }
        
        return formatter.string(from: number)!
    }
}

class Colors {
    var gl:CAGradientLayer!
    
    init() {
        let colorTop = UIColor(red: 255.0 / 255.0, green: 255.0 / 255.0, blue: 255.0 / 255.0, alpha: 1.0).cgColor
        let colorBottom = UIColor(red: 0.0 / 255.0, green: 0.0 / 255.0, blue: 0.0 / 255.0, alpha: 1.0).cgColor
        
        self.gl = CAGradientLayer()
        self.gl.colors = [colorTop, colorBottom]
        self.gl.locations = [0.0, 1.0]
    }
}

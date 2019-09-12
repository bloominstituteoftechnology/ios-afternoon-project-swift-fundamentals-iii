//
//  ViewController.swift
//  CurrencyConverter
//
//  Created by Ben Gohlke on 8/7/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Outlets/Properties
    
    @IBOutlet weak var fromCurrencyTextField: UITextField!
    @IBOutlet weak var toCurrencyTextField: UITextField!
    
    @IBOutlet weak var toCurrencyLabel: UILabel!
    
    @IBOutlet weak var cadButton: UIButton!
    @IBOutlet weak var mxnButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        currencyType = .Cad
        cadButton.isSelected = true
    }

    
    
    var currencyType: CurrencyType?
    enum CurrencyType {
        case Mxn
        case Cad
    }
    
    @IBAction func convertButtonTapped(_ sender: Any) {
        guard let dollars: Double = Double(fromCurrencyTextField.text!),
            let currencyType: CurrencyType = currencyType else {
                return }
        let currencyFormat = NumberFormatter()
        currencyFormat.numberStyle = .currency
        currencyFormat.locale = Locale(identifier: "en_US")
        
        toCurrencyTextField.text = currencyFormat.string(from: NSNumber(value: convert(dollars: dollars, to: currencyType)))
        
    }
    
    @IBAction func cadButtonTapped(_ sender: UIButton) {
        currencyType = .Cad
        cadButton.isSelected = true
        mxnButton.isSelected = false
        toCurrencyLabel.text = "Currency (CAD)"
        toCurrencyTextField.text = ""
        convertButtonTapped(self)
        
    }
    
    @IBAction func mxnButtonTapped(_ sender: UIButton) {
        currencyType = .Mxn
        mxnButton.isSelected = true
        cadButton.isSelected = false
        toCurrencyLabel.text = "Currency (MXN)"
        toCurrencyTextField.text = ""
        convertButtonTapped(self)
        
    }
    
    func convert(dollars: Double, to unit: CurrencyType) -> Double {
        let cadMoney: Double = 1.33
        let mxnMoney: Double = 19.10
        switch unit {
        case .Cad:
            return dollars * cadMoney
        case .Mxn:
            return dollars * mxnMoney
        }

    // MARK: - Helper Methods
}

}

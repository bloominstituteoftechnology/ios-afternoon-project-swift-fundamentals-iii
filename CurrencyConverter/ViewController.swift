//
//  ViewController.swift
//  CurrencyConverter
//
//  Created by Bobby Keffury on 7/16/19.
//  Copyright © 2019 Bobby Keffury. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var fromCurrencyTextField: UITextField!
    
    @IBOutlet weak var toCurrencyTextField: UITextField!
    
    @IBOutlet weak var toCurrencyLabel: UILabel!
    
    @IBOutlet weak var cadButton: UIButton!
    
    @IBOutlet weak var pesoButton: UIButton!
    
    var currencyType: CurrencyType = .cad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func convertButtonPressed(_ sender: Any) {
        
        guard let usCurrencyString = fromCurrencyTextField.text else { return }
        
        guard let usCurrency = Double(usCurrencyString) else {
             print("No dollar amount entered.")
            return
        }
        
        if cadButton.isSelected {
            toCurrencyLabel.text = "Currency (CAD)"
            toCurrencyTextField.text = "\(convert(dollars: usCurrency, to: .cad))"
        } else {
            toCurrencyLabel.text = "Currency (PES)"
            toCurrencyTextField.text = "\(convert(dollars: usCurrency, to: .peso))"
        }
        
    }
    
    
    enum CurrencyType {
        case cad
        case peso
    }
    
    
    func convert(dollars: Double, to unit: CurrencyType) -> Double {
        
        var result: Double = 0.0
        
        if unit == .cad {
            result = dollars * 1.35
        }
        if unit == .peso {
            result = dollars * 19.78
        }
        
        toCurrencyTextField.text = "\(result)"
        
        return result
        
        
    }
    
  
    
    @IBAction func cadButtonPressed(_ sender: Any) {
        guard let button = sender as? UIButton else { return }
        
        button.isSelected.toggle()
    }
    
    @IBAction func pesoButtonPressed(_ sender: Any) {
        guard let button = sender as? UIButton else { return }
        
        button.isSelected.toggle()
    }
    


}



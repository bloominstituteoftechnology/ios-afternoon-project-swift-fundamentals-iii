//
//  ViewController.swift
//  currency_converter
//
//  Created by Bradley Yin on 7/10/19.
//  Copyright © 2019 bradleyyin. All rights reserved.
//



import UIKit

enum CurrencyType{
    case cad
    case peso
}

class ViewController: UIViewController {
    @IBOutlet weak var UStextfield: UITextField!
    @IBOutlet weak var foreignTextField: UITextField!
    @IBOutlet weak var foreignCurrencyLabel: UILabel!
    @IBOutlet weak var currencyControl: UISegmentedControl!
    
    
    var currentCurrency : CurrencyType = .cad
    var currencyFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        return formatter
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        foreignTextField.isUserInteractionEnabled = false
        // Do any additional setup after loading the view.
    }
    
    func convert(dollars: Double, to unit: CurrencyType) -> Double {
        
        //$1 USD to $1.35 CAD
        //$1 USD to $19.78 CAD
        if unit == .cad {
            return dollars * 1.35
        }else{
            return dollars * 19.78
        }
    }

    @IBAction func convertButtonTapped(_ sender: Any) {
        guard let dollars = Double(UStextfield.text!) else {return}
        let formatedString = currencyFormatter.string(from: NSNumber(value: convert(dollars: dollars, to: currentCurrency)))
        foreignTextField.text = formatedString
    }
    
    @IBAction func selectorTapped(_ sender: Any) {
        switch currencyControl.selectedSegmentIndex {
        case 0:
            currentCurrency = .cad
            foreignCurrencyLabel.text = "Currency (CAD)"
        case 1:
            currentCurrency = .peso
            foreignCurrencyLabel.text = "Currency (Peso)"
        default:
            currentCurrency = .cad
            foreignCurrencyLabel.text = "Currency (CAD)"
        }
    }
}


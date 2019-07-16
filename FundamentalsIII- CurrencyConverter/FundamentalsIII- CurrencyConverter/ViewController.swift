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
        // Do any additional setup after loading the view.
    }

    enum CurrencyType {
        case cad
        case peso
    }
    
    var currencyType = CurrencyType.cad
    
    @IBAction func convertButtonPressed(_ sender: Any) {
    }
    
    @IBAction func cadButtonPressed(_ sender: Any) {
    }
    
    @IBAction func pesoButtonPressed(_ sender: Any) {
    }
}


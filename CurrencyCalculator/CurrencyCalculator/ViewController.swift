//
//  ViewController.swift
//  CurrencyCalculator
//
//  Created by Lambda_School_Loaner_141 on 7/15/19.
//  Copyright © 2019 Lambda_School_Loaner_141. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
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
        case pad
        case peso
    }
    
    var currencyType = CurrencyType.self
    
    }
    
    @IBAction func convertButtonPressed(_ sender: Any) {
    }
    
    
    @IBAction func cadButtonPressed(_ sender: Any) {
    }
    
    
    @IBAction func pesoButtonPressed(_ sender: Any) {
    }



}


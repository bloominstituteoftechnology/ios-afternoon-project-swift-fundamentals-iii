//
//  ViewController.swift
//  CurrencyCalculator
//
//  Created by Luqmaan Khan on 6/3/19.
//  Copyright © 2019 Luqmaan Khan. All rights reserved.
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
        
    
    }



    
    
    @IBAction func convertButtonPressed(_ sender: Any) {

    toCurrencyTextField.text = String((convert(unit: currencyType)))
       
        
    }
    

    
   
    
    
    
    @IBAction func cadButtonPressed(_ sender: Any) {
    currencyType = .cad
    cadButton.isSelected.toggle()
    toCurrencyLabel.text! = "Currency (CAD)"
    
}
   
        

    

    @IBAction func pesoButtonPressed(_ sender: Any) {
  currencyType = .peso
 pesoButton.isSelected.toggle()
  toCurrencyLabel.text = "Currency (MXN)"
            
        
    }
    


    enum CurrencyType {
        case cad
        case peso
    }

    
    func convert(unit: CurrencyType) -> Double {
        
        guard let usCurrencyText = fromCurrencyTextField.text else {
            return 0.0
        }
        
         if unit == CurrencyType.cad {
           return Double(usCurrencyText)! * (1.34)
           
        } else if unit == CurrencyType.peso {
            
            return Double(usCurrencyText)! * (19.80)
            
        }
            
            return 0.00
        }
}



///dollars:Double, to unit: CurrencyType

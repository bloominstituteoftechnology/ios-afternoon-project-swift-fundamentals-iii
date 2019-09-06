//
//  ViewController.swift
//  CurrencyConverter
//
//  Created by Ben Gohlke on 8/7/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//


import UIKit

class CurrencyConvertorViewController: UIViewController {
    
    @IBOutlet weak var pesoCurrencyLabel: UILabel!
    @IBOutlet weak var pesoCurrencyTextField: UITextField!
    @IBOutlet weak var usCurrencyLabel: UILabel!
    @IBOutlet weak var usCurrencyTextField: UITextField!
    @IBOutlet weak var calculateButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        usCurrencyLabel.text = "Currency (US)"
        
        if segmentedControl.selectedSegmentIndex == 0 {
            pesoCurrencyLabel.text = "Currency (PESO)"
        } else {
            pesoCurrencyLabel.text = "Currency (CAD)"
        }
        
        
        
        class CurrencyConvertorViewController: UIViewController {
            
            @IBOutlet weak var pesoCurrencyLabel: UILabel!
            @IBOutlet weak var pesoCurrencyTextField: UITextField!
            @IBOutlet weak var usCurrencyLabel: UILabel!
            @IBOutlet weak var usCurrencyTextField: UITextField!
            @IBOutlet weak var calculateButton: UIButton!
            @IBOutlet weak var segmentedControl: UISegmentedControl!
            
            
            override func viewDidLoad() {
                super.viewDidLoad()
                
                usCurrencyLabel.text = "Currency (US)"
                
                if segmentedControl.selectedSegmentIndex == 0 {
                    pesoCurrencyLabel.text = "Currency (PESO)"
                } else {
                    pesoCurrencyLabel.text = "Currency (CAD)"
                }
                
                usCurrencyLabel.font = UIFont(name: "System Bold", size: 17)
                pesoCurrencyLabel.font = UIFont(name: "System Bold", size: 17)
                
                calculateButton.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
                calculateButton.layer.cornerRadius = 8
                calculateButton.setTitle("CALCULATE", for: .normal)
                calculateButton.setTitleColor(.white, for: .normal)
                
                segmentedControl.layer.cornerRadius = 8
                segmentedControl.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
                segmentedControl.tintColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
                
            }
            
            @IBAction func calculateButtonTapped(_ sender: UIButton) {
                if segmentedControl.selectedSegmentIndex == 0 {
                    guard let usCurrency = usCurrencyTextField.text else {return}
                    let pesoWorth = 19.78
                    let usDollarAmount = Double(usCurrency) ?? 0.00
                    let pesoConvertedTotal = usDollarAmount * pesoWorth
                    
                    pesoCurrencyTextField.text = "$\(pesoConvertedTotal)"
                    
                } else if segmentedControl.selectedSegmentIndex == 1 {
                    guard let usCurrency = usCurrencyTextField.text else {return}
                    let cadWorth = 1.35
                    let usDollarAmount = Double(usCurrency) ?? 0.00
                    let cadConvertedTotal = usDollarAmount * cadWorth
                    
                    pesoCurrencyTextField.text = "$\(cadConvertedTotal)"
                }
            }
        }
     @IBAction func calculateButtonTapped(_ sender: UIButton) {
            if segmentedControl.selectedSegmentIndex == 0 {
                guard let usCurrency = usCurrencyTextField.text else {return}
                let pesoWorth = 19.78
                let usDollarAmount = Double(usCurrency) ?? 0.00
                let pesoConvertedTotal = usDollarAmount * pesoWorth
                
                pesoCurrencyTextField.text = "$\(pesoConvertedTotal)"
                
            } else if segmentedControl.selectedSegmentIndex == 1 {
                guard let usCurrency = usCurrencyTextField.text else {return}
                let cadWorth = 1.35
                let usDollarAmount = Double(usCurrency) ?? 0.00
                let cadConvertedTotal = usDollarAmount * cadWorth
                
                pesoCurrencyTextField.text = "$\(cadConvertedTotal)"
            }
        }
}

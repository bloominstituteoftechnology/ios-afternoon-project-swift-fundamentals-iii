//
//  ViewController.swift
//  CurrencyConverter
//
//  Created by Ben Gohlke on 8/7/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

//INTERNETS CURRENCY FORMAT CODE
//https://www.mysamplecode.com/2019/03/how-to-format-numeric-value-in-swift.html

extension Formatter {
    static let withDecimalSeparator: NumberFormatter = {
        
        let formatter = NumberFormatter()
        formatter.groupingSeparator = "_"
        formatter.decimalSeparator = "."
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        formatter.numberStyle = .decimal
        
        return formatter
    }()
    
    static let withCurrencySeparator: NumberFormatter = {
        
        let formatter = NumberFormatter()
        formatter.currencySymbol = "$"
        formatter.decimalSeparator = "."
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        formatter.numberStyle = .currency
        
        return formatter
    }()
}

extension Double {
    var formattedWithSeparator1: String {
        return Formatter.withDecimalSeparator.string(for: self) ?? ""
    }
    var formattedWithSeparator2: String {
        return Formatter.withCurrencySeparator.string(for: self) ?? ""
    }
}


//END OF INTERNETS CURRENCY FORMATTING CODE

enum Currency {
    case cad
    case mxn
}

var currency: Currency = .cad


class ViewController: UIViewController {
    
//A E S T H E T I C
    override func viewDidLoad() {
            super.viewDidLoad()
               assignbackground()
              // Do any additional setup after loading the view.
          }

    func assignbackground(){
          let background = UIImage(named: "iu.png")

          var imageView : UIImageView!
          imageView = UIImageView(frame: view.bounds)
          imageView.contentMode =  UIView.ContentMode.scaleAspectFill
          imageView.clipsToBounds = true
          imageView.image = background
          imageView.center = view.center
          view.addSubview(imageView)
          self.view.sendSubviewToBack(imageView)
      }
    
    
    
    
    
    
    
//
    
    // MARK: - Outlets/Properties
    
    @IBOutlet weak var fromCurrencyTextField: UITextField!
    @IBOutlet weak var toCurrencyTextField: UITextField!
    @IBOutlet weak var toCurrencyLabel: UILabel!
    @IBOutlet weak var cadButton: UIButton!
    @IBOutlet weak var mxnButton: UIButton!

    // MARK: - Actions


    
    @IBAction func convertButtonTapped(_ sender: UIButton) {
       
        guard let dollarsGet = fromCurrencyTextField.text else {return}
        guard let dollarsGetRekt = Double(dollarsGet) else {return}
        
        let convertedly = convert(dollarsGetRekt)
        toCurrencyTextField.text = ("\(convertedly.formattedWithSeparator2)")
        
    
    
    }
    
    @IBAction func cadButtonTapped(_ sender: UIButton) {
        if cadButton.isSelected {
            mxnButton.isSelected.toggle()
            cadButton.isSelected.toggle()
            toCurrencyLabel.text = "Currency (CAD)"
                currency = .cad
        
            
        }
        
    }
    
    @IBAction func mxnButtonTapped(_ sender: UIButton) {
        if mxnButton.isSelected  {
            mxnButton.isSelected.toggle()
            cadButton.isSelected.toggle()
  
            toCurrencyLabel.text = "Currency (MXN)"
                currency = .mxn
            
        
        }
        
    }
    
    // MARK: - Helper Methods
    func convert(_ dollars: Double) -> Double {
        var converted: Double
        if currency == .mxn {
            converted = dollars * 19.79
        }
        else {
            converted = dollars * 1.33
        }

// CURRENCY THINGY
        
 

        return(converted)
}
}



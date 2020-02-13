//
//  ViewController.swift
//  Currency Swap
//
//  Created by Shawn Gee on 2/11/20.
//  Copyright © 2020 Swift Student. All rights reserved.
//

import UIKit

class ConversionViewController: UIViewController {
    
    let conversionCalculator = ConversionCalculator()
    
    var inputCurrencyCode = "USD" {
          didSet {
              topCurrencyButton.setTitle(inputCurrencyCode, for: .normal)
          }
      }
      var outputCurrencyCode = "EUR" {
          didSet {
              bottomCurrencyButton.setTitle(outputCurrencyCode, for: .normal)
          }
      }

//MARK: - Subviews
    
    let backgroundImageView = UIImageView(image: UIImage(named: K.Images.background))
    
    let swapButton: UIButton = {
        let swapButton = UIButton()
        swapButton.setImage(UIImage(named: K.Images.swapButton), for: .normal)
        swapButton.addTarget(self, action: #selector(swapButtonPressed), for: .touchUpInside)
        return swapButton
    }()
    
    let topCurrencyButton = UIButton(title: "USD", titleColor: K.tanColor, font: K.mainFont, target: self, action: #selector(currencyButtonPressed(_:)))
    let topValueTextField: UITextField = {
        let topValueTextField = UITextField(placeholder: "$0.00", font: K.mainFont, color: K.tanColor, keyboardType: .numberPad, inputAccessoryView: nil)
        topValueTextField.textAlignment = .center
        return topValueTextField
    }()
    let bottomCurrencyButton = UIButton(title: "EUR", titleColor: K.greenColor, font: K.mainFont, target: self, action: #selector(currencyButtonPressed(_:)))
    let bottomValueTextField = UITextField(placeholder: "$0.00", font: K.mainFont, color: K.greenColor, keyboardType: .numberPad, inputAccessoryView: nil)
    
//MARK: - Auxillary Variables
    
    let currencyFormatter: NumberFormatter = {
        let currencyFormatter = NumberFormatter()
        currencyFormatter.numberStyle = .currency
        return currencyFormatter
    }()
    
    lazy var keyboardDismisser: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.contentInsetAdjustmentBehavior = .never
        scrollView.contentSize = view.frame.size
        scrollView.keyboardDismissMode = .interactive
        scrollView.alwaysBounceVertical = true
        return scrollView
    }()
    
//MARK: - Actions
    
    @objc func swapButtonPressed() {
        (inputCurrencyCode, outputCurrencyCode) = (outputCurrencyCode, inputCurrencyCode)
        calculateConversion()
    }
    
    @objc func currencyButtonPressed(_ button: UIButton) {
        let currencyTableViewController = CurrencyTableViewController()
        
        currencyTableViewController.currencyCodes = conversionCalculator.currencyCodes
        
        currencyTableViewController.selectionHandler = { [weak self] currencyCode in
            if button == self?.topCurrencyButton {
                self?.inputCurrencyCode = currencyCode
            } else {
                self?.outputCurrencyCode = currencyCode
            }
            self?.calculateConversion()
        }
        
        self.present(currencyTableViewController, animated: true, completion: nil)
    }

//MARK: - Methods
    
    func calculateConversion() {
        guard let text = topValueTextField.text, let inputAmount = Double(text) else { return }
        
        let result = conversionCalculator.convert(amount: inputAmount, fromCurrencyCode: inputCurrencyCode, toCurrencyCode: outputCurrencyCode)
        bottomValueTextField.text = currencyFormatter.string(from: NSNumber(value: result))
    }
    
//MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        topValueTextField.delegate = self
        bottomValueTextField.isUserInteractionEnabled = false
     
        layoutViews()
    }
    
    func layoutViews() {
        view.addSubview(keyboardDismisser)
        keyboardDismisser.fillSuperview()
        
        view.addSubview(backgroundImageView)
        backgroundImageView.fillSuperview()
        
        view.addSubview(swapButton)
        swapButton.centerHorizontally().centerVertically()
        
        let topStack = UIStackView(arrangedSubviews: [topCurrencyButton, topValueTextField])
        view.addSubview(topStack)
        topStack.centerHorizontally().centerVertically(multiplier: 0.4)
        topStack.axis = .vertical
        topStack.alignment = .center
        
        let bottomStack = UIStackView(arrangedSubviews: [bottomCurrencyButton, bottomValueTextField])
        view.addSubview(bottomStack)
        bottomStack.centerHorizontally().centerVertically(multiplier: 1.6)
        bottomStack.axis = .vertical
        bottomStack.alignment = .center
    }
}

//MARK: - UITextFieldDelegate

extension ConversionViewController: UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {
        calculateConversion()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        calculateConversion()
        textField.endEditing(true)
        return true
    }
}

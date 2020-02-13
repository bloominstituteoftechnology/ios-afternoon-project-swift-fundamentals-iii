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
        let topCurrencyCode = topCurrencyButton.title(for: .normal)
        let bottomCurrencyCode = bottomCurrencyButton.title(for: .normal)
        topCurrencyButton.setTitle(bottomCurrencyCode, for: .normal)
        bottomCurrencyButton.setTitle(topCurrencyCode, for: .normal)
        calculateConversion()
    }
    
    @objc func currencyButtonPressed(_ button: UIButton) {
        let currencyTableViewController = CurrencyTableViewController()
        
        currencyTableViewController.currencyCodes = conversionCalculator.currencyCodes
        currencyTableViewController.selectionHandler = { [weak self] currencyCode in
            button.setTitle(currencyCode, for: .normal)
            self?.calculateConversion()
        }
        
        self.present(currencyTableViewController, animated: true, completion: nil)
    }

//MARK: - Methods
    
    func calculateConversion() {
        guard let text = topValueTextField.text, let inputAmount = Double(text) else { return }
        guard let inputCurrencyCode = topCurrencyButton.titleLabel?.text, let outputCurrencyCode = bottomCurrencyButton.titleLabel?.text else { return }
        
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

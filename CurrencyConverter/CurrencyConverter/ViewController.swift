import UIKit

enum Currency {
    case cad
    case mxn
}

class ViewController: UIViewController {
    
    // MARK: - Outlets/Properties
    
    @IBOutlet weak var fromCurrencyTextField: UITextField!
    @IBOutlet weak var toCurrencyTextField: UITextField!
    
    @IBOutlet weak var toCurrencyLabel: UILabel!
    
    @IBOutlet weak var cadButton: UIButton!
    @IBOutlet weak var mxnButton: UIButton!

    var currency: Currency = .mxn
    
    // MARK: - Actions
    
    @IBAction func convertButtonTapped(_ sender: UIButton) {
        
        guard let input = fromCurrencyTextField.text else { return }
        if let unwrappedInput = Double(input) {
            let currencyFormatter: NumberFormatter = {
                let formatter = NumberFormatter()
                formatter.numberStyle = .currency
                return formatter
            }()
            if let unwrappedFormattedCurrency = currencyFormatter.string(from: NSNumber(value: convert(dollars: unwrappedInput))) {
                toCurrencyTextField.text = unwrappedFormattedCurrency
            }
        }
    }
    
    @IBAction func cadButtonTapped(_ sender: UIButton) {
        cadButton.isSelected.toggle()
        mxnButton.isSelected.toggle()
        toCurrencyLabel.text = "Currency (CAD)"
        self.currency = .cad
    }
    
    @IBAction func mxnButtonTapped(_ sender: UIButton) {
        mxnButton.isSelected.toggle()
        cadButton.isSelected.toggle()
        toCurrencyLabel.text = "Currency (MXN)"
        self.currency = .mxn
    }
    
    // MARK: - Helper Methods
    
    func convert(dollars: Double) -> Double {
        if self.currency == .cad {
            return dollars * 1.33
        } else {
            return dollars * 19.70
        }
    }
    
}


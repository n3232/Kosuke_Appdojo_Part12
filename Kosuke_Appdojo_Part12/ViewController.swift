//
//  ViewController.swift
//  Kosuke_Appdojo_Part12
//
//  Created by Kosuke Nagao on 2021/03/07.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet private weak var taxExcludedAmountTextField: UITextField!
    @IBOutlet private weak var salesTaxRateTextField: UITextField!
    @IBOutlet private weak var taxIncludedAmountLabel: UILabel!

    @IBAction private func pressCalculateButton(_ sender: Any) {
        let taxExcludedAmount = Float(taxExcludedAmountTextField.text!) ?? 0
        UserDefaults.standard.set(salesTaxRateTextField.text!, forKey: "salesTaxRate")
        let salesTaxRate = Float(salesTaxRateTextField.text!) ?? 0
        let taxIncludedAmount = Int(taxExcludedAmount + taxExcludedAmount * salesTaxRate / 100)
        taxIncludedAmountLabel.text = String(taxIncludedAmount)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        let salesTaxRateText = UserDefaults.standard.string(forKey: "salesTaxRate")
        salesTaxRateTextField.text = salesTaxRateText
    }
}

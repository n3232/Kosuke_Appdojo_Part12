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

    private static let salesTaxRateKey = "salesTaxRate"

    @IBAction private func pressCalculateButton(_ sender: Any) {
        let taxExcludedAmount = Float(taxExcludedAmountTextField.text!) ?? 0
        let salesTaxRate = Float(salesTaxRateTextField.text!) ?? 0
        UserDefaults.standard.set(salesTaxRate, forKey: Self.salesTaxRateKey)
        let taxIncludedAmount = Int(taxExcludedAmount + taxExcludedAmount * salesTaxRate / 100)
        taxIncludedAmountLabel.text = String(taxIncludedAmount)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        let salesTaxRateText = UserDefaults.standard.float(forKey: Self.salesTaxRateKey)
        salesTaxRateTextField.text = String(salesTaxRateText)
    }
}

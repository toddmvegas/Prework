//
//  ViewController.swift
//  Prework
//
//  Created by Todd Maracle on 1/21/21.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var splitBillLabel: UILabel!
    @IBOutlet weak var splitBillSlider: UISlider!
    @IBOutlet weak var splitBillPersonsLabel: UILabel!
    @IBOutlet weak var splitTipLabel: UILabel!
    @IBOutlet weak var splitTipSlider: UISlider!
    @IBOutlet weak var splitTipPersonsLabel: UILabel!
    @IBOutlet weak var splitTotalLabel: UILabel!
    @IBOutlet weak var splitTotalSlider: UISlider!
    @IBOutlet weak var splitTotalPersonsLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.billAmountTextField.delegate = self
        self.billAmountTextField.becomeFirstResponder()
        billAmountTextField.keyboardType = .decimalPad
        // Do any additional setup after loading the view.
    }

    @IBAction func onTap(_ sender: Any) {
    }

    @IBAction func calculateTip(_ sender: Any) {
        // Get bill amount from text field input
        let bill = Double(billAmountTextField.text!) ?? 0
        
        // Get Total tip by multiplying tip * tipPercentage
        let tipPercentages = [0.15, 0.18, 0.2, 0.25, 0.3]
        let tip = bill *
            tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        // Update Tip Amount Label
        tipAmountLabel.text = String(format: "$%.2f", tip)
        // Update Total Amount
        totalLabel.text = String(format: "$%.2f", total)
    }
    
    @IBAction func splitBill(_ sender: Any) {
        // Get bill amount from text field input
        let bill = Double(billAmountTextField.text!) ?? 0
        
        // Get split bill amount by dividing bill by number of people indicated
        let persons = Int(splitBillSlider.value)
        let personsDouble = Double(persons)
        let billPerPerson = Double(bill / personsDouble)
 
        // Update Split Bill and Split By Number of Persons Labels
        splitBillLabel.text = String(format: "$%.2f", billPerPerson)
        splitBillPersonsLabel.text = String(persons)
    }
    
    @IBAction func splitTip(_ sender: Any) {
        // Get bill amount from text field input
        let bill = Double(billAmountTextField.text!) ?? 0
        
        // Get Total tip by multiplying tip * tipPercentage
        let tipPercentages = [0.15, 0.18, 0.20, 0.25, 0.3]
        let tip = bill *
            tipPercentages[tipControl.selectedSegmentIndex]
       
        // Get split tip amount by dividing tip by number of people indicated
        let persons = Int(splitTipSlider.value)
        let personsDouble = Double(persons)
        let tipPerPerson = Double(tip / personsDouble)

        //Update Split Tip and Split by Number of Persons Labels
        splitTipLabel.text = String(format: "$%.2f", tipPerPerson)
        splitTipPersonsLabel.text = String(persons)
    }
   
    @IBAction func splitTotal(_ sender: Any) {
        // Get bill amount from text field input
        let bill = Double(billAmountTextField.text!) ?? 0
        
        // Get Total tip by multiplying tip * tipPercentage
        let tipPercentages = [0.15, 0.18, 0.20, 0.25, 0.3]
        let tip = bill *
            tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip

        // Get split total amount by dividing total by number of people indicated
        let persons = Int(splitTotalSlider.value)
        let personsDouble = Double(persons)
        let totalPerPerson = Double(total / personsDouble)

        //Update Split Total Label
        splitTotalLabel.text = String(format: "$%.2f", totalPerPerson)
        splitTotalPersonsLabel.text = String(persons)
    }
    
}


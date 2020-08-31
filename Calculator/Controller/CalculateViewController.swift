//
//  ViewController.swift
//  Calculator
//
//  Created by Alvin Escobar on 8/8/20.
//  Copyright © 2020 Alvin Escobar. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {
    
//    var operatorsArray: [String] = ["÷","×","+","-"]
    
    var holdFirstNumbers: [String] = []
    var holdSecondNumbers : [String] = []
    var holdsOperators: [String] = []
    
    
    @IBOutlet weak var displayNumberLabel: UILabel!
    @IBOutlet weak var allClearButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func clearButton(_ sender: UIButton) {
        displayNumberLabel.text = "0"
        allClearButton.setTitle("AC", for: .normal)
        holdFirstNumbers.removeAll()
        holdSecondNumbers.removeAll()
        holdsOperators.removeAll()
    }
    
    @IBAction func plusMinusButton(_ sender: UIButton) {
        if displayNumberLabel.text?.prefix(1) == "-" {
            displayNumberLabel.text?.removeFirst()
        } else {
            displayNumberLabel.text = "-" + displayNumberLabel.text!
        }
    }
    
    @IBAction func convertToPercentageButton(_ sender: UIButton) {
        if displayNumberLabel.text != "0" {
            if let textNumber = Double(displayNumberLabel.text!) {
                let result = textNumber / 100.0
                displayNumberLabel.text = String(result)
            } else {
                print("Could not convert to double")
            }
        } else {
            displayNumberLabel.text = "0"
        }
        
    }
    
    @IBAction func divideButton(_ sender: UIButton) {
        holdFirstNumbers.append(displayNumberLabel.text!)
        holdsOperators.append("÷")
    }
    
    @IBAction func multiplyButton(_ sender: UIButton) {
        holdFirstNumbers.append(displayNumberLabel.text!)
        holdsOperators.append("×")
    }
    
    
    @IBAction func subtractButton(_ sender: UIButton) {
        holdFirstNumbers.append(displayNumberLabel.text!)
        holdsOperators.append("-")
    }
    
    @IBAction func addButton(_ sender: UIButton) {
        holdFirstNumbers.append(displayNumberLabel.text!)
        holdsOperators.append("+")
    }
    
    @IBAction func resultEqualsToButton(_ sender: UIButton) {
        performCalculation()
    }
    
    @IBAction func goBackANumberButton(_ sender: UIButton) {
        if displayNumberLabel.text?.count == 1  {
            displayNumberLabel.text = "0"
        } else {
            displayNumberLabel.text?.removeLast()
            if holdFirstNumbers.count >= 1 {
                holdSecondNumbers.removeLast()
                print(holdSecondNumbers)
            }
        }
    }
    
    @IBAction func convertToDecimalButton(_ sender: UIButton) {
        if displayNumberLabel.text?.last == "." {
            displayNumberLabel.text?.removeLast()
            displayNumberLabel.text?.append(".")
        } else {
            displayNumberLabel.text?.append(".")
            if holdFirstNumbers.count >= 1 {
                holdSecondNumbers.append(".")
            }
        }
        
    }
    
    @IBAction func zeroButtonPressed(_ sender: UIButton) {
        setTitleLabelText(button: sender)
    }
    
    @IBAction func oneButtonPressed(_ sender: UIButton) {
        setTitleLabelText(button: sender)
    }
    
    
    @IBAction func twoButtonPressed(_ sender: UIButton) {
        setTitleLabelText(button: sender)
    }
    
    @IBAction func threeButtonPressed(_ sender: UIButton) {
        setTitleLabelText(button: sender)
    }
    
    @IBAction func fourButtonPressed(_ sender: UIButton) {
        setTitleLabelText(button: sender)
    }
    
    @IBAction func fiveButtonPressed(_ sender: UIButton) {
        setTitleLabelText(button: sender)
    }
    
    @IBAction func sixButtonPressed(_ sender: UIButton) {
        setTitleLabelText(button: sender)
    }
    
    @IBAction func sevenButtonPressed(_ sender: UIButton) {
        setTitleLabelText(button: sender)
    }
    
    @IBAction func eightButtonPressed(_ sender: UIButton) {
        setTitleLabelText(button: sender)
    }
    
    @IBAction func nineButtonPressed(_ sender: UIButton) {
        setTitleLabelText(button: sender)
    }
    
    
    func setTitleLabelText(button: UIButton){
        if displayNumberLabel.text == "0" {
            displayNumberLabel.text = button.currentTitle
        } else {
            if holdFirstNumbers.count >= 1 {
                displayNumberLabel.text = button.currentTitle
                holdSecondNumbers.append(displayNumberLabel.text!)
                let stringHolder = holdSecondNumbers.joined()
                displayNumberLabel.text = stringHolder
            } else {
                displayNumberLabel.text! += button.currentTitle!
            }
        }
        
        
        // set the All clear button title  to C because a number is displayed
        allClearButton.setTitle("C", for: .normal)
    }
    
    func performCalculation() {
        var result: Double
        var integer: Int
        if holdsOperators[0] == "+" {
            result = Double(holdFirstNumbers[0])! + Double(holdSecondNumbers.joined())!
            if result.truncatingRemainder(dividingBy: 1) == 0 {
                integer = Int(result)
                displayNumberLabel.text = String(integer)
            } else {
                displayNumberLabel.text = String(result)
            }
        } else if holdsOperators[0] == "-" {
            result = Double(holdFirstNumbers[0])! - Double(holdSecondNumbers.joined())!
            if result.truncatingRemainder(dividingBy: 1) == 0 {
                integer = Int(result)
                displayNumberLabel.text = String(integer)
            } else {
                displayNumberLabel.text = String(result)
            }
        } else if holdsOperators[0] == "÷" {
            result = Double(holdFirstNumbers[0])! / Double(holdSecondNumbers.joined())!
            if result.truncatingRemainder(dividingBy: 1) == 0 {
                integer = Int(result)
                displayNumberLabel.text = String(integer)
            } else {
                displayNumberLabel.text = String(result)
            }
        } else if holdsOperators[0] == "×" {
            result = Double(holdFirstNumbers[0])! * Double(holdSecondNumbers.joined())!
            if result.truncatingRemainder(dividingBy: 1) == 0 {
                integer = Int(result)
                displayNumberLabel.text = String(integer)
            } else {
                displayNumberLabel.text = String(result)
            }
        } else {
            print("no result")
        }
        holdFirstNumbers.removeAll()
        holdSecondNumbers.removeAll()
        holdsOperators.removeAll()
    }

}


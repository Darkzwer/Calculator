//
//  ViewController.swift
//  Calculator
//
//  Created by Igor on 02/09/2021.
//  Copyright © 2021 Simplesoft. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private weak var display: UILabel!
    
    private var userIsInMiddleOfTyping = false
    
    @IBAction private func touchDigit(_ sender: UIButton) {
        let digit = sender.currentTitle!
        if userIsInMiddleOfTyping {
            let textCurrentlyInDisplay = display.text!
            display.text = textCurrentlyInDisplay + digit
        } else {
            display.text = digit
        }
        userIsInMiddleOfTyping = true
    }
    
    private var displayValue: Double {
        get {
            return Double(display.text!)!
        }
        set {
            display.text = String(newValue)
        }
    }
    
    private var brain = CalculatorBrain()
    
    @IBAction private func performOperation(_ sender: UIButton) {
        if userIsInMiddleOfTyping {
            brain.setOperand(operand: displayValue)
            userIsInMiddleOfTyping = false
        }
        userIsInMiddleOfTyping = false
        if let mathematicSymbol = sender.currentTitle {
            brain.performOperation(symbol: mathematicSymbol)
        }
        displayValue = brain.result
    }
}

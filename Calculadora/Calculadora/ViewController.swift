//
//  ViewController.swift
//  Calculadora
//
//  Created by Ana on 21/2/25.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - UI Components
    @IBOutlet var displayLabel: UILabel!
    
    // MARK: - Screen State
    
    // Solo instanciamos la calculadora una sola vez y sobre esta constante se estructura la lógica.
    private var calculator = Calculator()
    private var isUserTypingNumber = false
    
    // MARK: - Button Actions

    @IBAction func digitTouched(_ sender: UIButton) {
        let digitText = sender.titleLabel?.text ?? ""
        let currentDisplayText = displayLabel.text ?? ""
        
        // Para ir acumulando los numeros en el diplay
        if isUserTypingNumber {
            displayLabel.text = currentDisplayText + digitText
        } else {
            displayLabel.text = digitText
            isUserTypingNumber = true
        }
        
    }
    
    @IBAction func operatorTouched(_ sender: UIButton) {
        let operatorText = sender.titleLabel?.text ?? ""
        let displayValueNumber = Double(displayLabel.text ?? "0") ?? .zero
        
        if isUserTypingNumber {
            calculator.setOperand(displayValueNumber)
            isUserTypingNumber = false
        }
        
        calculator.executeOperation(operatorText)
        displayLabel.text = "\(String(describing: calculator.result))"
        
    
    }
}


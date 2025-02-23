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
    private var formatter: NumberFormatter {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        return numberFormatter
    }

    
    private var displayFormattedValue: Double {
        // Formateamos de texo a número
        get {
            guard let displayText = displayLabel.text,
                  let formattedNSNumber = formatter.number(from: displayText) else {
                return .zero
            }
            return Double(truncating: formattedNSNumber)
        }
        // Formateamos de numero a texto
        set {
            displayLabel.text = formatter.string(
                from: NSNumber(floatLiteral: newValue)
            )
        }
       
    }
    
    
    
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
        
        if isUserTypingNumber {
            calculator.setOperand(displayFormattedValue)
            isUserTypingNumber = false
        }
        
        calculator.executeOperation(operatorText)
        displayFormattedValue = calculator.result  ?? .zero
        
    
    }
}


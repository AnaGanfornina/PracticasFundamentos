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
    
    @IBOutlet var equalButton: UIButton!
    
    @IBOutlet var galindaImage: UIImageView!
    
    // IBCollections para luego cambiarles el color del background
    @IBOutlet var operationsButtons: [UIButton]! // MARK: Dentro de este grupo también se encuentra el clear
    @IBOutlet var digitsButtons:[UIButton]! // MARK: Dentro de este grupo también se encuentra la coma
    
    
    
    // MARK: - Screen State
    
    // Solo instanciamos la calculadora una sola vez y sobre esta constante se estructura la lógica.
    private var calculator = Calculator()
    private var isUserTypingNumber = false
    private var isUserTypingComma = false
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

    @IBAction func clearDisplay(_ sender: UIButton) {
        // Realizamos un calculo por 0 para que el resultado pendiente para que el resultado pendiente sea 0
        calculator.setOperand(0)
        calculator.executeOperation("*")
        displayFormattedValue = .zero
    }
    
    @IBAction func commaTouched(_ sender: UIButton) {
        let commaText = sender.titleLabel?.text ?? ""
        let currentDisplayText = displayLabel.text ?? ""
        
        // Solo si no hay una coma ya escrita la añadimos
        if !currentDisplayText.contains(","){
            displayLabel.text = currentDisplayText + commaText
            isUserTypingComma = true
        }
    }
    
    @IBAction func digitTouched(_ sender: UIButton) {
        let digitText = sender.titleLabel?.text ?? ""
        let currentDisplayText = displayLabel.text ?? ""
        
        
        // Para ir acumulando los numeros en el diplay
        
        if isUserTypingNumber || isUserTypingComma {
            displayLabel.text = currentDisplayText + digitText
            isUserTypingComma = false
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
    // MARK: - Change position
    
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        coordinator.animate(alongsideTransition: { context in
            if UIApplication.shared.statusBarOrientation.isLandscape {
                // Landscape
                self.galindaImage.isHidden = true // Mostrar imagen en vertical
                self.equalButton.configuration?.baseBackgroundColor = .elfyGreenEqual
                
                for button in self.operationsButtons {
                    button.configuration?.baseBackgroundColor = .elfyGreenOperation
                }
                
                for button in self.digitsButtons {
                    button.configuration?.baseBackgroundColor = .elfyGreenDigit
                }
                

            } else {
                // Portrait
                self.galindaImage.isHidden = false  // Ocultar imagen en horizontal
                
                self.equalButton.configuration?.baseBackgroundColor = .glindaPinkEqual
                
                for button in self.operationsButtons {
                    button.configuration?.baseBackgroundColor = .glindaPinkOperation
                }
                
                for button in self.digitsButtons {
                    button.configuration?.baseBackgroundColor = .glindaPinkDigit
                }
                // TODO: Revisa el bug de que lo primero con lo que se abra la calculadora sea en horizontal, aparece la imagen ??
                
                
                
            }
        })
    }
}


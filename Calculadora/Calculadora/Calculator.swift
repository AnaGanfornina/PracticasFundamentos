//
//  Calculator.swift
//  Calculadora
//
//  Created by Ana on 22/2/25.
//

import Foundation


struct Calculator {
    private var accumulator: Double?
    
    private var operators: [String: Operation] = [
        "+": Operation.binaryOperation(+),
        "-": Operation.binaryOperation(-),
        "X": Operation.binaryOperation(*),
        "/": Operation.binaryOperation(/),
        "=": Operation.equal
    ]
    
    private var pendingBinaryOperation: PendingBinaryOperation?
    
    var resultIsPending: Bool {
        pendingBinaryOperation != nil
    }
    
    var result: Double? {
        accumulator
    }
    
    private enum Operation {
        case binaryOperation((Double, Double) -> Double)
        case equal
    }
    
    /// Esta estructura y su funcion realizará el calculo, el cual luego será asignado al accumulador.
    ///  Divide la operacion en dos partes
    private struct PendingBinaryOperation {
        let number: Double
        let function: (Double, Double) -> Double
        
        func executeOperation(_ secondNumber: Double) -> Double {
            function(number, secondNumber)
        }
    }
    
    
    /// Función que asigna un número al acumulador. Este será el primer operando de la operación
    mutating func setOperand(_ number: Double) {
        accumulator = number
    }
    
    mutating func executeOperation(_ symbol: String) {
        guard let operation = operators[symbol] else {
            return
        }
        switch operation {
        case let .binaryOperation(function):
            // Comprobamos si tenemos una operación pendiente
            if resultIsPending {
                // Nos aseguramos de que tenemos el segundo digito
                // Llamamos a la función de forma recursiva
                executeOperation("=")
            }
            guard let number = accumulator else {
                return
            }
            
            pendingBinaryOperation = PendingBinaryOperation(
                number: number,
                function: function
            )
            
        case .equal:
            guard let pendingBinaryOperation,
                  let secondNumber = accumulator else {
                return
            }
            accumulator = pendingBinaryOperation.executeOperation(secondNumber)
            self.pendingBinaryOperation = nil
        }
         
    }
    
    
}

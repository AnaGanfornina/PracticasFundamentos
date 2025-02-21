//
//  ViewController.swift
//  Calculadora
//
//  Created by Ana on 21/2/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var displayLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func digitTouched(_ sender: UIButton) {
        let digitText = sender.titleLabel?.text ?? ""
        displayLabel.text  = digitText
    }
    
    @IBAction func operatorTouched(_ sender: UIButton) {
        let operatorText = sender.titleLabel?.text ?? ""
        print(operatorText)
    }
}


//
//  LogInViewController.swift
//  SpotyClone
//
//  Created by Ana on 28/2/25.
//

import UIKit

final class LogInViewController: UIViewController {

    // MARK: -  Outlet
    
    @IBOutlet var usernameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var logInButton: UIButton!
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        customizeButton()
    }


}

// MARK: - View Customization

private extension LogInViewController {
    func customizeButton(){
        var configuration = UIButton.Configuration.filled()
        configuration.cornerStyle = .fixed
        configuration.baseBackgroundColor = .lightGray
        // Distancia entre el texto y los bordes
        configuration.contentInsets = NSDirectionalEdgeInsets(
            top: 10,
            leading: 20,
            bottom: 10,
            trailing: 20
        )   // Distancia del texto y el borde del botón
        configuration.background.cornerRadius = 20
        configuration.attributedTitle = AttributedString(
            "Log in",
            attributes: AttributeContainer([
                .font: UIFont.boldSystemFont(ofSize: 16),
                .foregroundColor: UIColor.black
            ]))
        logInButton.configuration = configuration
        
    }
}

//
//  SingInViewController.swift
//  SpotyClone
//
//  Created by Ana on 27/2/25.
//

import UIKit

final class SingInViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet var logInButton: UIButton!
    @IBOutlet var singUpButton: UIButton!
    @IBOutlet var continueWithAppleButton: UIButton!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        customizeButton()
    }

}


// MARK: - SetupView

private extension SingInViewController {
    /// Customize sing in button
    func customizeButton() {
        var singUpConfiguration = UIButton.Configuration.filled()
        singUpConfiguration.background.cornerRadius = 20
        singUpConfiguration.baseBackgroundColor = UIColor.spotyGreen
        singUpConfiguration.attributedTitle = AttributedString(
            "Sing Up",
            attributes: AttributeContainer(
                [
                    .font: UIFont.systemFont(ofSize: 15, weight: .bold),
                    .foregroundColor: UIColor.white
                ]
            )
        )
        // Aplicamos los cambios al botón
        logInButton.configuration = singUpConfiguration
    }
}

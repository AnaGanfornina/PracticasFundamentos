//
//  SignInViewController.swift
//  SpotyClone
//
//  Created by Ana on 28/2/25.
//

import UIKit

class SignInViewController: UIViewController {

    // MARK: - Outlets
    
    @IBOutlet var logInButton: UIButton!
    @IBOutlet var signUpButton: UIButton!
    @IBOutlet var continueWhithAppleButton: UIButton!
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Ejecutamos la customizacion de botones
        customizeButtons()
    }

}


// MARK: - Setup View

private extension SignInViewController {
    
    func customizeButtons() {
        // Customizar el sing up button
        var signUpConfiguraiton = UIButton.Configuration.filled()
        signUpConfiguraiton.background.cornerRadius = 20
        signUpConfiguraiton.baseBackgroundColor = UIColor.spotyGreen
        signUpConfiguraiton.attributedTitle = AttributedString(
            "String up free",
            attributes: AttributeContainer(
                [
                    NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 15),
                    // Tambien puedes poner .font
                    .foregroundColor: UIColor.white
                    
                ]
            )
        )
        //Le asignamos los cambios
        signUpButton.configuration = signUpConfiguraiton
        
        // Customizar el ontinueWithApple button
        var continueWithAppleConfiguration = UIButton.Configuration.bordered()
        continueWithAppleConfiguration.background.cornerRadius = 20
        continueWithAppleConfiguration.background.strokeWidth = 1
        continueWithAppleConfiguration.background.strokeColor = .lightGray
        continueWithAppleConfiguration.attributedTitle = AttributedString(
            "ContinuewithApple",
            attributes: AttributeContainer([
                .font: UIFont.boldSystemFont(ofSize: 15),
                .foregroundColor: UIColor.white
                ]
            )
        )
        // Añadir la imagen de la manzana
        
        continueWithAppleConfiguration.image = UIImage(systemName: "apple.logo")?.applyingSymbolConfiguration(.init(weight: .bold))
        
        continueWithAppleConfiguration.imagePlacement = .leading
        continueWithAppleConfiguration.imagePadding = 18
        continueWithAppleConfiguration.baseForegroundColor = .white
        
        //Le asignamos los cambios al botón
        continueWhithAppleButton.configuration = continueWithAppleConfiguration
    }
}

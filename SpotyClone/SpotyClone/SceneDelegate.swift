//
//  SceneDelegate.swift
//  SpotyClone
//
//  Created by Ana on 26/2/25.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let scene = (scene as? UIWindowScene) else { return }
        // Creo a partir del UIWindowScene un UIWindow
        let window = UIWindow(windowScene: scene)
        // Instancio el signViewController
        let signInViewController = SignInViewController() 
        // Creo el el navigation controller y le digo que el root va a ser el signIn
        let navigationController = UINavigationController(rootViewController: signInViewController)
        // Defino el navigation controller como root del UIWindow
        window.rootViewController = navigationController
        // Configuramos el window para que sea la venana clave
        window.makeKeyAndVisible()
        // Persisto en memoria el window de la linea 19
        self.window = window
        
    }
    

  


}


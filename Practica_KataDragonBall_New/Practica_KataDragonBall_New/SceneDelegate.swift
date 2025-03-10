//
//  SceneDelegate.swift
//  Practica_KataDragonBall_New
//
//  Created by Ana on 10/3/25.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
       
        guard let _ = (scene as? UIWindowScene) else { return }
        
        let networkModel = NetworkModel(client: APIClient())
                
                networkModel.login(
                    user: "a@gmail.com",
                    password: "abcdef") { result in
                        switch result {
                        case let .success(jwtToken):
                            print(jwtToken)
                            
                        case let .failure(error):
                            print (error)
                            
                        }
                    }
    }



}


//
//  NetworkModel.swift
//  Practica_KataDragonBall_New
//
//  Created by Ana on 10/3/25.
//

import Foundation

final class NetworkModel {
    
    private var baseComponents: URLComponents {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "dragonball.keepcoding.education"
        return components
    }
    
    private let client: APIClient
    
    init(client: APIClient) {
        self.client = client
    }
    
    func login(
        user: String,
        password: String,
        completion: @escaping (Result<String, APIClientError>) -> Void)
    {
        // Configuramos el path, la url
        var components = baseComponents
        components.path = "/api/auth/login"
        
        //vamos a desempaquetar la url, por si acaso la que le hemos pasado no fuera válida
        guard let url = components.url else {
            completion(.failure(.malformedURL))
            return
        }
        
        // Componer el string en base al usuario y la contraseña, para pasarselo al setValue
        let loginString = String(format: "%@:%@", user, password)
        
        // Encodifico el loginString a un data con utf8
        guard let loginData = loginString.data(using: .utf8) else {
            completion(.failure(.decodingAuthorizationFailed))
            return
        }
        
        // la codificamos en base 64
        let base64LoginData = loginData.base64EncodedString()
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        request.setValue("Basic \(base64LoginData)", forHTTPHeaderField: "Authorization")
        
        client.jwt(request, completion: completion)
            
        }

}

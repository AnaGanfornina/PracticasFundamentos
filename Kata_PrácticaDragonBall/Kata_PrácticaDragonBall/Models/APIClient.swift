//
//  APIClient.swift
//  Kata_PrácticaDragonBall
//
//  Created by Ana on 8/3/25.
//

import Foundation

enum APIClientError: Error {
    case malformedURL
    case noData
    case statusCode(code: Int?)
    case decodingFailed
    case unknown
}

struct APIClient {
    private let session: URLSession
    
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    /// Método por el cual vamos a obtener el JWT de la API a traves del URLRequest
    func jwt(
        _ request: URLRequest,
        completion: @escaping (Result<String, APIClientError>) -> Void
    ){
        // Obtiene de forma asíncrona los datos de la request
        let task = session.dataTask(with: request) { data, response, error in
            
            guard error == nil else {
                // Si hay un error lo envio al completion, que lo ejecutará
                if let error = error as? NSError {
                    completion(.failure(.statusCode(code: error.code)))
                } else {
                    completion(.failure(.unknown))
                }
                return
            }
            
            guard let data else {
                completion(.failure(.noData))
                return
            }
            
            
            let response = response as? HTTPURLResponse
            
            guard let response, response.statusCode == 200 else {
                completion(.failure(.statusCode(code: response?.statusCode)))
                return
            }
            
            // Desempaquetamos el data(token) para codificarlo a un string
            guard let jwt = String(data: data, encoding: .utf8) else {
                completion(.failure(.decodingFailed))
                return
            }
            
            completion(.success(jwt))
        }
        
        task.resume()
    }
}




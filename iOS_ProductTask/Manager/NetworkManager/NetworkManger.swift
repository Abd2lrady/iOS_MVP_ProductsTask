//
//  NetworkManger.swift
//  iOS_ProductTask
//
//  Created by Ahmad Abdulrady
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    
    private init() {}
        
}

extension NetworkManager {
    
    func request(target: NetworkTargetProtocol,
                    completionHandler: @escaping (Result<Data,Error>) -> Void) {
        var urlComponents = URLComponents()
        
        urlComponents.scheme = target.scheme.rawValue
        urlComponents.host = target.baseURL
        urlComponents.path = target.path
        
        guard let url = urlComponents.url
        else {
            completionHandler(.failure(NetworkError.badUrl))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = target.method.rawValue
        
        URLSession.shared.dataTask(with: request) { data, httpReponse, error in
            
            if let error = error {
                
                completionHandler(.failure(error))
            }
            
            guard let httpReponse = (httpReponse as? HTTPURLResponse) else {
                
                completionHandler(.failure(NetworkError.badResponse))
                return
            }

            if let data = data,
               (200...299).contains(httpReponse.statusCode) {
                
                completionHandler(.success(data))
            } 
            
        }.resume()
        
      
    }
}

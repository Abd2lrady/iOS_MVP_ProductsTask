//
//  NetworkManger.swift
//  iOS_ProductTask
//
//  Created by Ahmad Abdulrady
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    private let sessionConfig: URLSessionConfiguration
    
    init(sessionConfig: URLSessionConfiguration = .default) {
        self.sessionConfig = sessionConfig
    }
    
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
            completionHandler(.failure(NetworkError.invalidUrl))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = target.method.rawValue
        
        let session = URLSession(configuration: sessionConfig)
        
        let task = session.dataTask(with: request) { data, response, error in
            
            if let error = (error as? URLError) {
                switch error {
                case URLError.notConnectedToInternet:
                    completionHandler(.failure(NetworkError.notConnected))
                    return
                default:
                    completionHandler(.failure(NetworkError.unknownError(error: error)))
                    return
                }
            }
            
            guard let httpReponse = (response as? HTTPURLResponse)
            else {
                completionHandler(.failure(NetworkError.unknownResponse(response: response ?? URLResponse())))
                return
            }
            
            let statusCode = httpReponse.statusCode
            
            switch httpReponse.statusCode {
                
            case (200 ..< 300):
                if let data = data {
                    completionHandler(.success(data))
                } else {
                    completionHandler(.failure(NetworkError.invalidData))
                }
                return
                
            case (400 ..< 499):
                completionHandler(.failure(NetworkError.invalidRequest(statusCode: statusCode)))
                return
                
            case (500 ..< 600):
                completionHandler(.failure(NetworkError.serverError(statusCode: statusCode)))
                return
                
            default:
                completionHandler(.failure(NetworkError.unknownResponse(response: httpReponse)))
                return
            }
            
            
        }
        
        task.resume()
    }
}

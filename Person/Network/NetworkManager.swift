//
//  NetworkManager.swift
//  DemoApp
//
//  Created by Amit Kumar on 04/01/24.
//

import Foundation

/// List of Network erros
enum NetworkError: Error {
    case badURL
    case badResponse
    case errorDecodingData
    case invalidURL
}

/// NetworkManager - to get the data from API. network manager is implemented
final class NetworkManager: NetworkManagerProtocol {
    
    /// URL session varable- To initialise the Session
    private var urlSession: URLSession
    
    /// initialiser of netwokr Manager with URL session
    /// - Parameter urlSession: It takes URLSession as param, Detault URL session is passed.
    init(urlSession: URLSession = .shared) {
        self.urlSession = urlSession
    }
    
    /// Method to fetch tha codable data from the network
    /// - Parameters:
    ///   - url: url of api , which needs to be fetch
    ///   - completion:completion callback once data is receved.
    func fetch<T: Codable>(url: URL, completion: @escaping (Result<T, Error>) -> Void) {
        
        self.urlSession.dataTask(with: url, completionHandler: { data, response, error in
            
            guard (response as? HTTPURLResponse)?.statusCode == 200 else {
                completion(.failure(NetworkError.badResponse))
                return
            }
            
            guard let data = data,
                  let object = try? JSONDecoder().decode(T.self, from: data) else {
                completion(.failure(NetworkError.errorDecodingData))
                return
            }
            
            completion(.success(object))
        })
        .resume()
    }
    
    /// Method to fetch tha image data from the network
    /// - Parameters:
    ///   - url: url of image , which needs to be fetch
    ///   - completion:completion callback once image is receved.
    func fetchImage(url: URL, completion:@escaping (Data?, Error?) -> ()) {
        self.urlSession.dataTask(with: url, completionHandler: { data, response, error in
            completion(data, error)
        })
        .resume()
    }
}

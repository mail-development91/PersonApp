//
//  NetworkModule.swift
//  DemoApp
//
//  Created by Amit Kumar on 04/01/24.
//

import Foundation

/// NetworkManagerProtocol: This is service layer inteface, Mthod is implementad in class
protocol NetworkManagerProtocol {
    
    /// Method to fetch tha codable data from the network
    /// - Parameters:
    ///   - url: url of api , which needs to be fetch
    ///   - completion:completion callback once data is receved.
    func fetch<T: Codable>(url: URL,
                           completion: @escaping (Result<T, Error>) -> Void)
    
    /// Method to fetch tha image data from the network
    /// - Parameters:
    ///   - url: url of image , which needs to be fetch
    ///   - completion:completion callback once image is receved.
    func fetchImage(url: URL,
                    completion:@escaping (Data?, Error?) -> ())
}

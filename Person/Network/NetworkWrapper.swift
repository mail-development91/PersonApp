//
//  NetworkWrapper.swift
//  DemoApp
//
//  Created by Amit Kumar on 30/01/24.
//

import Foundation
import Alamofire

protocol NetworkWrapperProtocol {
    
    /// This is wapper to Alamofire. This method to request the API data with Params
    /// - Parameters:
    ///   - url: URL of the API
    ///   - parameters: Params of the API
    ///   - type: Type of Data
    ///   - completion: Complition cloure the pass the Data to class it called
    func request<T: Codable>(url: String,
                             parameters: T?,
                             type: T.Type,
                             completion:@escaping (Response<T>) -> Void)
    
    /// This is wapper to Alamofire. This method to request the Image data from URL
    /// - Parameters:
    ///   - url: URL of the Image
    ///   - completion: Complition cloure the pass the Image to class it called
    func requestImage(url: String,
                      completion:@escaping (AFDataResponse<Data?>) -> Void)
}

final class NetworkWrapper : NetworkWrapperProtocol {

    /// This is wapper to Alamofire. This method to request the API data with Params
    /// - Parameters:
    ///   - url: URL of the API
    ///   - parameters: Params of the API
    ///   - type: Type of Data
    ///   - completion: Complition cloure the pass the Data to class it called
    func request<T: Codable>(url: String,
                             parameters: T?,
                             type: T.Type,
                             completion:@escaping (Response<T>) -> Void) {
        AF.request(url,
                   parameters: parameters).responseDecodable(of: type) { response in
           completion(response)
       }
    }
    
    /// This is wapper to Alamofire. This method to request the Image data from URL
    /// - Parameters:
    ///   - url: URL of the Image
    ///   - completion: Complition cloure the pass the Image to class it called
    func requestImage(url: String,
                      completion:@escaping (AFDataResponse<Data?>) -> Void) {
        AF.request(NetworkConstants.imageURL,
                   method: .get).response{ response in
            completion(response)
        }
    }
}



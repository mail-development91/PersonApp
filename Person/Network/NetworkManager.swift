//
//  NetworkManager.swift
//  DemoApp
//
//  Created by Amit Kumar on 04/01/24.
//

import Foundation
import Alamofire

typealias Response<T> = DataResponse<T, AFError>

final class NetworkManager: NetworkManagerProtocol{
    let network: NetworkWrapperProtocol
    
    init(network: NetworkWrapperProtocol) {
        self.network = network
    }
    
    /// Method - getData - To get data from network API
    /// - Parameter completion: Complition willl be callled once API response is available.
    func getData<T: Codable>(completion:@escaping (T?, AFError?) -> ()) {
        self.network.request(url: NetworkConstants.url,
                             parameters: NetworkConstants.params as? T,
                             type: T.self) { response in
            switch response.result {
            case .success (let data):
                completion(data, nil);
                break
            case .failure (let error):
                completion(nil, error);
                break
            }
        }
    }
    
    /// Method - getImage - To get Image from network API
    /// - Parameter completion: Complition willl be callled once API response is available.
    func getImage<T: Sendable>(completion:@escaping (T?) -> ()) {
        self.network.requestImage(url: NetworkConstants.imageURL) { response in
            switch response.result {
            case .success (let data):
                completion(data as? T)
                break
            case .failure:
                completion(nil)
                break
            }
        }
    }
}

//
//  NetworkModule.swift
//  DemoApp
//
//  Created by Amit Kumar on 04/01/24.
//

import Foundation
import Alamofire

protocol NetworkManagerProtocol {
    var network : NetworkWrapperProtocol { get }
    
    /// Method - getData - To get data from network API
    /// - Parameter completion: Complition willl be callled once API response is available.
    func getData<T: Codable>(completion: @escaping (T?, AFError?) -> ()) -> Void;
    
    /// Method - getImage - To get Image from network API
    /// - Parameter completion: Complition willl be callled once API response is available.
    func getImage<T: Sendable>(completion:@escaping (T?) -> ()) -> Void;
}

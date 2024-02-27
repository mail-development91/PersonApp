//
//  PersonDetailService.swift
//  DemoApp
//
//  Created by Amit Kumar on 07/01/24.
//

import Foundation

/// PersonDetailDataManager class conforms PersonDetailDataManagerProtocol
final class PersonDetailDataManager : PersonDetailDataManagerProtocol {
    
    /// network manager object
    private let network : NetworkManagerProtocol
    
    /// PersonDetailDataManager initializer
    /// - Parameter network: network object
    init(_ network: NetworkManagerProtocol) {
        self.network = network
    }
    
    /// To get the Image
    /// - Parameter completion: Completion to callback
    func getImage(completion: @escaping (PersonImage?) -> ()) {
        let url = URL(string: NetworkConstants.imageURL)!

        self.network.fetchImage(url: url) { data, error in
            guard let data = data, error == nil else {
                completion(nil)
                return
            }
            completion(PersonImage(data: data))
        }
    }
}


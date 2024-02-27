//
//  PersonService.swift
//  DemoApp
//
//  Created by Amit Kumar on 06/01/24.
//

import Foundation

/// PersonDataManager class conforms PersonDataManagerProtocol
final class PersonDataManager: PersonDataManagerProtocol {
    
    /// network object
    private let network :NetworkManagerProtocol
    
    /// PersonDataManager initializer
    /// - Parameter network: network service object
    init(_ network: NetworkManagerProtocol) {
        self.network = network
    }
    
    /// To get Person List Data from API.
    /// - Parameter completion: completion Callback once to get PersonData
    func getPersonList(completion: @escaping (PersonData?,
                                              PersonError?) -> ()) {
        let url = URL(string: NetworkConstants.url)!
        self.network.fetch(url: url) { (response: Result<PersonData, Error>) in
            switch response {
            case .success(let personData):
                completion(personData, nil)
            case .failure(let error):
                completion(nil, PersonError(error))
            }
        }
    }
}


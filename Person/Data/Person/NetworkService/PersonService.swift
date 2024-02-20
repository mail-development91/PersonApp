//
//  PersonService.swift
//  DemoApp
//
//  Created by Amit Kumar on 06/01/24.
//

import Foundation

final class PersonService: PersonServiceProtocol {
    private let network :NetworkManagerProtocol
    
    init(_ network: NetworkManagerProtocol) {
        self.network = network
    }
    
    /// To get Person List Data from API.
    /// - Parameter completion: completion Callback once to get PersonData
    func getPersonList(completion: @escaping (PersonData?, PersonError?) -> ()) {
        self.network.getData { personData, error in
            completion(personData, error?.error())
        }
    }
}


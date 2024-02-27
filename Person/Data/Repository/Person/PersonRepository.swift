//
//  PersonUserCase.swift
//  DemoApp
//
//  Created by Amit Kumar on 06/01/24.
//

import Foundation

/// PersonRepository class conforms PersonRepositoryProtocol
final class PersonRepository: PersonRepositoryProtocol {
    
    /// data manager for PersonRepository
    private let dataManager: PersonDataManagerProtocol?
    
    init(_ dataManager: PersonDataManagerProtocol) {
        self.dataManager = dataManager
    }
    
    /// To call Service to get Data from API
    /// - Parameter completion: complition is calback, once we get API response
    func callService(completion: @escaping (PersonData?,
                                            PersonError?) -> ()) {
        dataManager?.getPersonList(completion: { personData, error in
            completion(personData, error)
        })
    }
}

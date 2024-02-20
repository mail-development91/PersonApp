//
//  PersonUserCase.swift
//  DemoApp
//
//  Created by Amit Kumar on 06/01/24.
//

import Foundation

final class PersonRepository: PersonRepositoryProtocol {
    private let service: PersonServiceProtocol?
    
    init(_ service: PersonServiceProtocol) {
        self.service = service
    }
    
    /// To call Service to get Data from API
    /// - Parameter completion: complition is calback, once we get API response
    func callService(completion: @escaping (PersonData?, PersonError?) -> ()) {
        service?.getPersonList(completion: { personData, error in
            completion(personData, error)
        })
    }
}

//
//  PersonUserCase.swift
//  DemoApp
//
//  Created by Amit Kumar on 06/01/24.
//

import Foundation

class PersonUseCase: PersonUseCaseProtocol {
    private let repository: PersonRepositoryProtocol?
    
    init(_ repository: PersonRepositoryProtocol) {
        self.repository = repository
    }
    
    /// to Load Data from services
    /// - Parameter completion: completion callback
    func loadData(completion: @escaping (PersonData?, PersonError?) -> ()) {
        repository?.callService(completion: { personData, error in
            completion(personData, error)
        } )
    }
}

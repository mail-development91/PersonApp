//
//  PersonUserCase.swift
//  DemoApp
//
//  Created by Amit Kumar on 06/01/24.
//

import Foundation

/// PersonUseCase class - conforms PersonUseCaseProtocol
final class PersonUseCase: PersonUseCaseProtocol {
    
    /// repository - PersonUseCase
    private let repository: PersonRepositoryProtocol?
    
    /// PersonUseCase initialiser
    /// - Parameter repository: object
    init(_ repository: PersonRepositoryProtocol) {
        self.repository = repository
    }
    
    /// to Load Data from services
    /// - Parameter completion: completion callback
    func loadData(completion: @escaping (PersonData?,
                                         PersonError?) -> ()) {
        repository?.callService(completion: { personData, error in
            completion(personData, error)
        } )
    }
}

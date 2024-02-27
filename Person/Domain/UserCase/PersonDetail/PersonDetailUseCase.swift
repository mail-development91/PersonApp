//
//  PersonUserCase.swift
//  DemoApp
//
//  Created by Amit Kumar on 06/01/24.
//

import Foundation

/// PersonDetailUseCase -class conforms PersonDetailUseCaseProtocol
final class PersonDetailUseCase: PersonDetailUseCaseProtocol {
    
    /// repository object
    private let repository: PersonDetailRepositoryProtocol?
    
    /// PersonDetailUseCase initializer
    /// - Parameter repository: repository object
    init(_ repository: PersonDetailRepositoryProtocol) {
        self.repository = repository
    }
    
    /// To load images
    /// - Parameter completion: completion callback
    func loadImage(completion: @escaping (PersonImage?) -> ()) {
        repository?.callImageService(completion: { personImage in
            completion(personImage)
        })
    }
}

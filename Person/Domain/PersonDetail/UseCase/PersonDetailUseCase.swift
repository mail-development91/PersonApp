//
//  PersonUserCase.swift
//  DemoApp
//
//  Created by Amit Kumar on 06/01/24.
//

import Foundation

final class PersonDetailUseCase: PersonDetailUseCaseProtocol {
    private let repository: PersonDetailRepositoryProtocol?
    
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

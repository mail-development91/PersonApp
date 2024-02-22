//
//  PersonDetailRepository.swift
//  Person
//
//  Created by Amit Kumar on 17/02/24.
//

import Foundation

final class PersonDetailRepository: PersonDetailRepositoryProtocol {
    private let service: PersonDetailServiceProtocol?
    
    init(_ service: PersonDetailServiceProtocol) {
        self.service = service
    }
    
    /// To call Service to get Image from API
    /// - Parameter completion: complition is calback, once we get API response image
    func callImageService(completion: @escaping (PersonImage?) -> ()) {
        service?.getImage(completion: { personData in
            completion(personData)
        })
    }
}

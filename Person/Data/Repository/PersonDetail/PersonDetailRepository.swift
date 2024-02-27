//
//  PersonDetailRepository.swift
//  Person
//
//  Created by Amit Kumar on 17/02/24.
//

import Foundation

/// PersonDetailRepository class confoms PersonDetailRepositoryProtocol
final class PersonDetailRepository: PersonDetailRepositoryProtocol {
    
    /// Data manager - PersonDetailRepository
    private let dataManager: PersonDetailDataManagerProtocol?
    
    /// PersonDetailRepository initializer
    /// - Parameter dataManager: PersonDetailDataManager object
    init(_ dataManager: PersonDetailDataManagerProtocol) {
        self.dataManager = dataManager
    }
    
    /// To call Service to get Image from API
    /// - Parameter completion: complition is calback, once we get API response image
    func callImageService(completion: @escaping (PersonImage?) -> ()) {
        dataManager?.getImage(completion: { personData in
            completion(personData)
        })
    }
}

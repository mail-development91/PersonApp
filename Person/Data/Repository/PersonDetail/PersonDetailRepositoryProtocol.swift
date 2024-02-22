//
//  PersonDetailRepositoryProtocol.swift
//  Person
//
//  Created by Amit Kumar on 17/02/24.
//

import Foundation

protocol PersonDetailRepositoryProtocol {
    
    /// To call Service to get Image from API
    /// - Parameter completion: complition is calback, once we get API response image
    func callImageService(completion: @escaping (PersonImage?) -> ())
}

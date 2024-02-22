//
//  MockPersonDetailRepository.swift
//  Person
//
//  Created by Amit Kumar on 21/02/24.
//

import Foundation
@testable import Person

class MockPersonDetailRepository: PersonDetailRepositoryProtocol {
    var isError = false
    let imageData = MockPersonData().getImageData()
    
    func callImageService(completion: @escaping (PersonImage?) -> ()) {
        if isError {
            completion(nil)
        } else {
            completion(PersonImage(data: imageData))
        }
    }
}

//
//  MockPersonRepository.swift
//  Person
//
//  Created by Amit Kumar on 21/02/24.
//

import Foundation
@testable import Person

final class MockPersonRepository: PersonRepositoryProtocol {
    var isError = false

    func callService(completion: @escaping (PersonData?, PersonError?) -> ()) {
        let mockData = MockPersonData().getMockReponse()
        let error = MockPersonData().getError()
        if isError {
            completion(nil, error)
        } else {
            completion(mockData, nil)
        }
    }
}

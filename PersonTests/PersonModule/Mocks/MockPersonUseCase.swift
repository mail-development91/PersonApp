//
//  MockPersonUseCase.swift
//  DemoApp
//
//  Created by Amit Kumar on 08/01/24.
//

import Foundation

class MockPersonUseCase: PersonUseCaseProtocol {
    var mockData = MockPersonData().getMockReponse()
    var error = MockPersonData().getError()
    var isError = false
    func loadData(completion: @escaping (PersonData?, PersonError?) -> ()) {
        if isError {
            completion(nil, error)
        } else {
            completion(mockData, nil)
        }
    }
}

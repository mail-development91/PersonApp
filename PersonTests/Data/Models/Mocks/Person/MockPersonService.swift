//
//  MockPersonService.swift
//  DemoApp
//
//  Created by Amit Kumar on 08/01/24.
//

import Foundation
@testable import Person

class MockPersonService: PersonServiceProtocol {
    var isError = false
    func getPersonList(completion: @escaping (PersonData?, PersonError?) -> ()) {
        let mockData = MockPersonData().getMockReponse()
        let error = MockPersonData().getError()
        if isError {
            completion(nil, error)
        } else {
            completion(mockData, nil)
        }
    }    
}

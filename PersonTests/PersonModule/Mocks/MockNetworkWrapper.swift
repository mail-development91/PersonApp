//
//  MockNetworkWrapper.swift
//  DemoAppTests
//
//  Created by Amit Kumar on 01/02/24.
//

import Foundation
import Alamofire

class MockNetworkWrapper: NetworkWrapperProtocol {
    
    var isError = false
    func request<T: Encodable>(url: String, parameters: T, completion: @escaping (DataResponse<PersonData, AFError>) -> Void) {
        
        let mockData = MockPersonData().getMockReponse()
        let error = MockPersonData().getError()
        func getPersonList(completion: @escaping (PersonData?, PersonError?) -> ()) {
            if isError {
                completion(nil, error)
            } else {
                completion(mockData, nil)
            }
        }
    }
}

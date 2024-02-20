//
//  MockNetworkManager.swift
//  DemoAppTests
//
//  Created by Amit Kumar on 08/01/24.
//

import Foundation

class MockNetworkManager: NetworkManagerProtocol {
    
    var network: NetworkWrapperProtocol
    var isError = false
    
    init(network: NetworkWrapperProtocol) {
        self.network = MockNetworkWrapper()
    }
    
    func getData(completion: @escaping (PersonData?, PersonError?) -> ()) {
        let mockData = MockPersonData().getMockReponse()
        let error = MockPersonData().getError()
        if isError {
            completion(nil, error)
        } else {
            completion(mockData, nil)
        }
    }
}




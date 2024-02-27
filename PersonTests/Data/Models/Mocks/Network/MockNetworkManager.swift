//
//  MockNetworkManager.swift
//  DemoAppTests
//
//  Created by Amit Kumar on 05/02/24.
//

import Foundation
@testable import Person

final class MockNetworkManager: NetworkManagerProtocol, Mockable {
    var isError = false
    var loaded = false
    
    func fetch<T>(url: URL, completion: @escaping (Result<T, Error>) -> Void) where T : Decodable, T : Encodable {
        return loadJson(filename: MockConstant.fileName,
                        extensionType: .json,
                        type: T.self, isError: isError, completion: completion)
    }
    
    func fetchImage(url: URL, completion: @escaping (Data?, Error?) -> ()) {
        if isError {
            completion(nil, PersonError(errorCode: MockConstant.errorCode2, errorMessage: MockConstant.errorMessage2) as? Error)
        } else {
            loaded = true
            completion(MockPersonData().getImageData(), nil)
        }
    }
}

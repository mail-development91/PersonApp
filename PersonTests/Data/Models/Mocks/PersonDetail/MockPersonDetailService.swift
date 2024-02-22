//
//  MockPersonDetailService.swift
//  DemoApp
//
//  Created by Amit Kumar on 05/02/24.
//

import Foundation
@testable import Person

class MockPersonDetailService: PersonDetailServiceProtocol {
    let imageData = MockPersonData().getImageData()
    var isError = false

    /// To get the Image
    /// - Parameter completion: Completion to callback
    func getImage(completion: @escaping (PersonImage?) -> ()) {
        if isError {
            completion(nil)
        } else {
            completion(PersonImage(data: imageData))
        }
    }
}

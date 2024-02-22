//
//  MockPersonDetailUseCase.swift
//  DemoAppTests
//
//  Created by Amit Kumar on 05/02/24.
//

import Foundation
@testable import Person

class MockPersonDetailUseCase: PersonDetailUseCaseProtocol {
    var loaded = false
    var isError = false
    let imageData = MockPersonData().getImageData()
    /// To load images
    /// - Parameter completion: completion callback
    func loadImage(completion: @escaping (PersonImage?) -> ()) {
        if isError {
            completion(nil)
        } else {
            loaded = true
            completion(PersonImage(data: imageData))
        }
    }
}

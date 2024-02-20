//
//  PersonDetailService.swift
//  DemoApp
//
//  Created by Amit Kumar on 07/01/24.
//

import Foundation

final class PersonDetailService: PersonDetailServiceProtocol {
    private let network :NetworkManagerProtocol
    
    init(_ network: NetworkManagerProtocol) {
        self.network = network
    }
    
    /// To get the Image
    /// - Parameter completion: Completion to callback
    func getImage(completion: @escaping (PersonImage?) -> ()) {
        self.network.getImage { image in
            let personImage = PersonImage(data: image)
            completion(personImage)
        }
    }
}


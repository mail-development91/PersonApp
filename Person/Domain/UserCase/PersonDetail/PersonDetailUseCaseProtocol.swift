//
//  PersonUserCaseProtocal.swift
//  DemoApp
//
//  Created by Amit Kumar on 06/01/24.
//

import Foundation

protocol PersonDetailUseCaseProtocol {
    
    /// To load images
    /// - Parameter completion: completion callback
    func loadImage(completion: @escaping (PersonImage?) -> ())
}

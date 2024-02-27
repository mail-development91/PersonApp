//
//  PersonDetailServiceProtocol.swift
//  DemoApp
//
//  Created by Amit Kumar on 07/01/24.
//

import Foundation

/// PersonDetailDataManagerProtocol
protocol PersonDetailDataManagerProtocol {
    
    /// To get the Image
    /// - Parameter completion: Completion to callback
    func getImage(completion: @escaping (PersonImage?) -> ())
}

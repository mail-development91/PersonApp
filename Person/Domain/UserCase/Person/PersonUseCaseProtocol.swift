//
//  PersonUserCaseProtocal.swift
//  DemoApp
//
//  Created by Amit Kumar on 06/01/24.
//

import Foundation

/// PersonUseCaseProtocol
protocol PersonUseCaseProtocol {
    
    /// to Load Data from services
    /// - Parameter completion: completion callback
    func loadData(completion: @escaping (PersonData?,
                                         PersonError?) -> ())
}

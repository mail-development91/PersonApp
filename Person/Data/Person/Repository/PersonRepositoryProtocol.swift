//
//  PersonUserCaseProtocal.swift
//  DemoApp
//
//  Created by Amit Kumar on 06/01/24.
//

import Foundation

protocol PersonRepositoryProtocol {
    /// To call Service to get Data from API
    /// - Parameter completion: complition is calback, once we get API response
    func callService(completion: @escaping (PersonData?, PersonError?) -> ())
}

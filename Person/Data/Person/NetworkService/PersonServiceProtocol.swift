//
//  PersonServiceProtocol.swift
//  DemoApp
//
//  Created by Amit Kumar on 06/01/24.
//

import Foundation

protocol PersonServiceProtocol {
    
    /// To get Person List Data from API.
    /// - Parameter completion: completion Callback once to get PersonData
    func getPersonList(completion: @escaping (PersonData?, PersonError?) -> ())
}

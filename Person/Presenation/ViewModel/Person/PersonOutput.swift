//
//  PersonOutput.swift
//  DemoApp
//
//  Created by Amit Kumar on 07/01/24.
//

import Foundation

/// PersonOutputProtocol - to be conform by class
protocol PersonOutputProtocol {
    
    /// To Show Result on View
    func showResult()
    
    /// To Show Error on screen
    /// - Parameter error: Error Message to be shown
    func showError(_ error: String)
}

/// PersonRouterProtocol - to be conform by class
protocol PersonRouterProtocol {
    /// To load the detail view of Person
    /// - Parameter person: Person Modal Object to show data
    func loadPersonDetail(person: Person)
}

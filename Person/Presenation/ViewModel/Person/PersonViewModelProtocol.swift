//
//  PersonViewModelProtocol.swift
//  DemoApp
//
//  Created by Amit Kumar on 06/01/24.
//

import Foundation

/// PersonViewModelProtoco
protocol PersonViewModelProtocol {
    
    /// Router of Screens
    var router: PersonRouterProtocol? {get}
    
    /// Output is View, to show the response Data
    var output: PersonOutputProtocol? {get set}
    
    /// To load Data frpm API
    func loadData()
    
    /// Person List object
    var personList : [Person] {get}
}

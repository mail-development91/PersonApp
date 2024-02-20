//
//  PersonViewModelProtocol.swift
//  DemoApp
//
//  Created by Amit Kumar on 06/01/24.
//

import Foundation

protocol PersonViewModelProtocol {
    var router: PersonRouterProtocol? {get}
    var output: PersonOutputProtocol? {get set}
    /// To loaed Data frpm API
    func loadData()
    var personList : [Person] {get}
}

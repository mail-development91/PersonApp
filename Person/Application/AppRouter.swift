//
//  AppRouter.swift
//  DemoApp
//
//  Created by Amit Kumar on 06/01/24.
//

import Foundation
import UIKit

final class AppRouter: PersonRouterProtocol {
    lazy var network = NetworkManager()
    
    /// load the person view controller . This is ninitial view contoller
    /// - Returns: it returns person view controller
    func loadPersonController() -> UIViewController {
        let module = PersonModuleManager(network)
        let controller = module.getPersonViewController()
        return controller
    }
    
    /// Load the details of Peron
    /// - Parameter person: Data of the person
    func loadPersonDetail(person: Person) {
        let module = PersonDetailModuleManager(network)
        let controller = module.getPersonDetailViewController(person)
        let navigation = UINavigationController.get()
        navigation.pushViewController(controller, animated: true)
    }
}

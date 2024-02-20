//
//  AppRouter.swift
//  DemoApp
//
//  Created by Amit Kumar on 06/01/24.
//

import Foundation
import UIKit


class AppRounter: PersonRouterProtocol {
    
    lazy var network = NetworkManager(network: NetworkWrapper())
    
    func loadPersonController() -> BaseViewController {
        
        let module = PersonModuleManager(network)
        let controller = module.getPersonViewController()
        return controller
    }
    
    func loadPersonDetail(person: Person) {
        let module = PersonDetailModuleManager(network)
        let controller = module.getPersonDetailViewController(person)
        let navigation = UINavigationController.get()
        navigation.pushViewController(controller, animated: true)
    }
}

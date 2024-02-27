//
//  PersonModuleManager.swift
//  DemoApp
//
//  Created by Amit Kumar on 06/01/24.
//

import Foundation

/// Person Module Manager - Assemble all the layers here
final class PersonModuleManager {
    
    /// Network Manager Variable
    private let networkManager : NetworkManagerProtocol
    
    /// Router Variable
    private let router = AppRouter()
    
    /// Initialiser with network Manager
    /// - Parameter network: networkManager object
    init(_ network: NetworkManagerProtocol) {
        self.networkManager = network
    }
    
    /// To get Person View controller
    /// - Returns: Person View controller
    func getPersonViewController() -> PersonViewController {
        let viewConrtoller = PersonViewController()
        viewConrtoller.viewModel = getViewModel()
        viewConrtoller.viewModel?.output = viewConrtoller
        return viewConrtoller
    }
    
    /// To Get PersonService
    /// - Returns: PersonService object
    private func getService() -> PersonDataManagerProtocol {
        let service = PersonDataManager(networkManager)
        return service
    }
    
    /// To get PersonRepository
    /// - Returns: PersonRepository object
    private func getRepository() -> PersonRepositoryProtocol {
        let repository = PersonRepository(getService())
        return repository
    }
    
    /// To get PersonUseCase
    /// - Returns: PersonUseCase Object
    private func getUseCase() -> PersonUseCaseProtocol {
        let useCase = PersonUseCase(getRepository())
        return useCase
    }
    
    /// To get PersonViewModel
    /// - Returns: PersonViewModel Object
    private func getViewModel() -> PersonViewModelProtocol {
        let viewModel = PersonViewModel(getUseCase(), router: router)
        return viewModel
    }
}

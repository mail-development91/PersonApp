//
//  PersonModuleManager.swift
//  DemoApp
//
//  Created by Amit Kumar on 06/01/24.
//

import Foundation

final class PersonModuleManager {
    private let networkManager : NetworkManagerProtocol
    private let router = AppRouter()
    
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
    private func getService() -> PersonServiceProtocol {
        let service = PersonService(networkManager)
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

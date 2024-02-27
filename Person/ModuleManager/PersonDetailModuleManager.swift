//
//  PersonDetailModuleManager.swift
//  DemoApp
//
//  Created by Amit Kumar on 07/01/24.
//

import Foundation

/// Detail Module Manager
final class PersonDetailModuleManager {
    
    /// Network Manager - object
    private let networkManager : NetworkManagerProtocol
    
    /// initialiser with network manager
    /// - Parameter network: Network Manager - object
    init(_ network: NetworkManagerProtocol) {
        self.networkManager = network
    }
    
    /// To get person detail view controller
    /// - Parameter person: Person Model Object
    /// - Returns: It returns PersonDetailViewController
    func getPersonDetailViewController(_ person: Person) -> PersonDetailViewController {
        let viewConrtoller = PersonDetailViewController()
        viewConrtoller.viewModel = getViewModel()
        viewConrtoller.viewModel?.personDetail = person
        viewConrtoller.viewModel?.output = viewConrtoller
        return viewConrtoller
    }
    
    /// To get PersonDetailService
    /// - Returns: PersonDetailService Object
    private func getService() -> PersonDetailDataManagerProtocol {
        let service = PersonDetailDataManager(networkManager)
        return service
    }
    
    /// To get PersonDetailRepository
    /// - Returns: PersonDetailRepository Object
    private func getRepository() -> PersonDetailRepositoryProtocol {
        let repository = PersonDetailRepository(getService())
        return repository
    }
    
    /// To get PersonDetailUseCase
    /// - Returns: PersonDetailUseCase object
    private func getUseCase() -> PersonDetailUseCaseProtocol {
        let useCase = PersonDetailUseCase(getRepository())
        return useCase
    }
    
    /// To get PersonDetailViewModel
    /// - Returns: PersonDetailViewModel Object
    private func getViewModel() -> PersonDetailViewModelProtocol {
        let viewModel = PersonDetailViewModel(getUseCase())
        return viewModel
    }
}

//
//  PersonDetailModuleManager.swift
//  DemoApp
//
//  Created by Amit Kumar on 07/01/24.
//

import Foundation

final class PersonDetailModuleManager {
    private let networkManager : NetworkManagerProtocol
    
    init(_ network: NetworkManagerProtocol) {
        self.networkManager = network
    }
    
    /// To get person detail view controller
    /// - Parameter person: Person Model Object
    /// - Returns: It returns PersonDetailViewController
    func getPersonDetailViewController(_ person: Person) -> PersonDetailViewController {
        let viewConrtoller = PersonDetailViewController.instantiateFromStoryboard()
        viewConrtoller.viewModel = getViewModel()
        viewConrtoller.viewModel?.personDetail = person
        viewConrtoller.viewModel?.output = viewConrtoller
        return viewConrtoller
    }
    
    /// To get PersonDetailService
    /// - Returns: PersonDetailService Object
    private func getService() -> PersonDetailServiceProtocol {
        let service = PersonDetailService(networkManager)
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

//
//  PersonViewModel.swift
//  DemoApp
//
//  Created by Amit Kumar on 06/01/24.
//

import Foundation

/// PersonViewModel to interact view &
final class PersonViewModel: PersonViewModelProtocol {
    
    /// variable obects
    var personList :[Person] = []
    var output: PersonOutputProtocol?
    var router: PersonRouterProtocol?
    private let useCase: PersonUseCaseProtocol?
    
    /// initializer of person view model
    /// - Parameters:
    ///   - useCase: usecase of PersonViewModel
    ///   - router: router
    init(_ useCase: PersonUseCaseProtocol, router: PersonRouterProtocol) {
        self.useCase = useCase
        self.router = router
    }
    
    /// To Load Data from API, and show data on view OR show error
    func loadData() {
        useCase?.loadData(completion: { personData, error in
            guard let persons = personData?.data else {
                self.output?.showError(error?.errorMessage ?? AppConstant.ErrorMessage)
                return
            }
            self.personList = persons
            self.output?.showResult()
        })
    }
    
    /// To load PersonDetailView
    /// - Parameter person: Person Object to show detail Data
    func loadPersonDetail(person: Person) {
        self.router?.loadPersonDetail(person: person)
    }
}


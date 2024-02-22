//
//  MockPersonViewModel.swift
//  DemoAppTests
//
//  Created by Amit Kumar on 06/02/24.
//

import Foundation
@testable import Person

final class MockPersonViewModel: PersonViewModelProtocol {
    var loaded = false
    var router: PersonRouterProtocol?
    var output: PersonOutputProtocol?
    var personList: [Person] = MockPersonData().getMockReponse().data ?? []
    var error = MockPersonData().getError()
    
    init(op: PersonViewController) {
        output = op
        router = MockAppRouter()
    }
    
    func loadData() {
        loaded = true
        print("Data is loaded")
    }
}

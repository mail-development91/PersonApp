//
//  MockPersonViewModel.swift
//  DemoAppTests
//
//  Created by Amit Kumar on 06/02/24.
//

import Foundation


class MockPersonViewModel: PersonViewModelProtocol {
    var router: PersonRouterProtocol?
    var output: PersonOutputProtocol?
    
    var personList: [Person] = MockPersonData().getMockReponse().data ?? []
    var error = MockPersonData().getError()
    
    init(op: PersonViewController) {
        output = op
        router = MockAppRouter()
    }
    
    func loadData() {
        print("Data is loaded")
    }
}

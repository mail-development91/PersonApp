//
//  MockPersonDetailViewModel.swift
//  DemoApp
//
//  Created by Amit Kumar on 07/02/24.
//

import Foundation

class MockPersonDetailViewModel: PersonDetailViewModelProtocol {
    var output: PersonDetailOutputProtocol?
    
    var personDetail: Person?
    
    init(op: PersonDetailViewController, detail: Person) {
        output = op
        personDetail = detail
    }
    
}

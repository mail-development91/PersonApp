//
//  MockPersonDetailViewModel.swift
//  DemoApp
//
//  Created by Amit Kumar on 07/02/24.
//

import Foundation
@testable import Person

class MockPersonDetailViewModel: PersonDetailViewModelProtocol {
    var output: PersonDetailOutputProtocol?
    var personDetail: Person?
    var loaded = false
    var isError = false
    let imageData = MockPersonData().getImageData()
    
    init(op: PersonDetailViewController, detail: Person) {
        output = op
        personDetail = detail
    }
    
    func loadImage() {
        loaded = true
        print("Data is loaded")
    }
}

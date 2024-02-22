//
//  MockAppRouter.swift
//  DemoAppTests
//
//  Created by Amit Kumar on 05/02/24.
//

import Foundation
@testable import Person

final class MockAppRouter: PersonRouterProtocol {
    var loaded = false
    
    func loadPersonDetail(person: Person) {
        loaded = true
        print("Detail Screen is Loaded")
    }
}

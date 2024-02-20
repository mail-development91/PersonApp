//
//  MockAppRouter.swift
//  DemoAppTests
//
//  Created by Amit Kumar on 05/02/24.
//

import Foundation

class MockAppRouter: PersonRouterProtocol {
    func loadPersonDetail(person: Person) {
        print("Detail Screen is Loaded")
    }
}

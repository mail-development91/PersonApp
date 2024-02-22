//
//  PersonViewModelTest.swift
//  DemoAppTests
//
//  Created by Amit Kumar on 08/01/24.
//

import XCTest
@testable import Person

class PersonViewModelTest: XCTestCase, PersonOutputProtocol {
    
    var isSuccessCalled = false
    var viewModdel : PersonViewModel!
    let useCase = MockPersonUseCase()
    let appRouter = MockAppRouter()
    var expectation : XCTestExpectation!
    
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        viewModdel = PersonViewModel(useCase, router: appRouter)
        viewModdel.output = self
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        viewModdel = nil
    }

    
    func testShowResultSuccess() {
        isSuccessCalled = false
        useCase.isError = false
        viewModdel.loadData()
        XCTAssertTrue(isSuccessCalled, "Data is shown")
    }
    
    func testShowResultFail() {
        isSuccessCalled = false
        useCase.isError = true
        viewModdel.loadData()
        XCTAssertFalse(isSuccessCalled, "Error is shown")
    }
    
    func testLoadDetailSuccess() {
        let mockPersonData = MockPersonData().getMockReponse()
        if let person = mockPersonData.data?[0] {
            self.viewModdel.router?.loadPersonDetail(person: person)
            XCTAssertNotNil(person, "Detail Screen is Loaded")
        }
    }
    
    
    // MARK: PersonOutputProtocol Implementation
    
    func showResult() {
        isSuccessCalled = true
    }
    
    func showError() {
        isSuccessCalled = false
    }
    
    func showError(_ error: String) {
        isSuccessCalled = false
    }
}

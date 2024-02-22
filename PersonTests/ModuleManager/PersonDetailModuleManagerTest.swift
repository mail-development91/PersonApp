//
//  PersonDetailModuleManagerTest.swift
//  DemoAppTests
//
//  Created by Amit Kumar on 05/02/24.
//

import XCTest
@testable import Person

final class PersonDetailModuleManagerTest: XCTestCase {

    let networkManager = MockNetworkManager()
    let mockPersonData = MockPersonData().getMockReponse().data?[0]
    var personDetailModule: PersonDetailModuleManager!
    
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        personDetailModule = PersonDetailModuleManager(networkManager)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testgetPersonDetailViewControllerSuccess() {
        if let personData = mockPersonData {
           let vc = personDetailModule.getPersonDetailViewController(personData)
            XCTAssertNotNil(vc, "Detail Screen Loaded successfully")
        }
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}

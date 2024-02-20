//
//  PersonServiceTest.swift
//  DemoAppTests
//
//  Created by Amit Kumar on 08/01/24.
//

import XCTest
@testable import DemoApp

class PersonServiceTest: XCTestCase {

    let networkManager = MockNetworkManager(network: MockNetworkWrapper())
    var service : PersonService!
    
    override func setUpWithError() throws {
        //try super.setUpWithError()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        service = PersonService(networkManager)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        service = nil
        //try super.tearDownWithError()
    }

    func testGetPersonListSuccess() {
        
        networkManager.isError = false
        service.getPersonList { personData, error in
            
            let personCount = personData?.data?.count
            XCTAssertGreaterThan(personCount!, 0, "Count is greater than 0")
            XCTAssertNotNil(personData, "Person Data is not nil")
            XCTAssertNil(error, "Error is nil")
        }
    }
    
    func testGetPersonListFailure() {
        networkManager.isError = true
        service.getPersonList { personData, error in
            // Error found in failed case of Data fetch
            XCTAssertNil(personData, "Data is nil")
            XCTAssertNotNil(error, "\(String(describing: error?.errorMessage))")
        }
    }
}

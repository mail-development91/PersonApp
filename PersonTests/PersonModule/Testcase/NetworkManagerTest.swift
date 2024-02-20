//
//  NetworkManagerTest.swift
//  DemoAppTests
//
//  Created by Amit Kumar on 05/02/24.
//

import XCTest
@testable import DemoApp

final class NetworkManagerTest: XCTestCase {

    let network = MockNetworkWrapper()
    var networkManager: NetworkManagerProtocol!
    
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        networkManager = NetworkManager(network: network)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        networkManager = nil
    }
    
    
    func testGetDataSuccess() {
        network.isError = false
        networkManager.getData { personData, error in
            
            let personCount = personData?.data?.count
            XCTAssertGreaterThan(personCount!, 0, "Count is greater than 0")
            
            XCTAssertNotNil(personData, "Person Data is not nil")
            XCTAssertNil(error, "Error is nil")

        }
    }
    
    func testGetDataFailure() {
        network.isError = true
        networkManager.getData { personData, error in
            // Error found in failed case of Data fetch
            XCTAssertNil(personData, "Data is nil")
            
            XCTAssertNotNil(error, "\(String(describing: error?.errorMessage))")
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

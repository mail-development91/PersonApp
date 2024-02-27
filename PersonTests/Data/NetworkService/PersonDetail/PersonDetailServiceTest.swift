//
//  PersonDetailServiceTest.swift
//  DemoAppTests
//
//  Created by Amit Kumar on 05/02/24.
//

import XCTest
@testable import Person

final class PersonDetailServiceTest: XCTestCase {

    let networkManager = MockNetworkManager() //MockNetworkManager(network: MockNetworkWrapper())
    var dataManager : PersonDetailDataManagerProtocol!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        dataManager = PersonDetailDataManager(networkManager)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        dataManager = nil
    }

    func testLoadImageSuccess() throws {
        networkManager.isError = false
        networkManager.loaded = false
        dataManager.getImage { personImage in
            XCTAssertTrue(self.networkManager.loaded, "Image is Loaded")
       }
    }
    
    func testLoadImageFail() async throws {
        networkManager.isError = true
        dataManager.getImage { personImage in
            XCTAssertNil(personImage, "Image is nil. NO image downloaded")
       }
    }


    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}

//
//  PersonUseCaseTest.swift
//  DemoAppTests
//
//  Created by Amit Kumar on 08/01/24.
//

import XCTest
@testable import Person

final class PersonUseCaseTest: XCTestCase {
    let personRepository = MockPersonRepository()
    var personUseCase: PersonUseCase!
    //var personList : PersonData
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        personUseCase = PersonUseCase(personRepository)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
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
    
    func testLoadDataSuccess() {
        
        personRepository.isError = false
        personUseCase.loadData { personData, error in
            
            let personCount = personData?.data?.count
            XCTAssertGreaterThan(personCount!, 0, "Count is greater than 0")
            XCTAssertNotNil(personData, "Person Data is not nil")
            XCTAssertNil(error, "Error is nil")

        }
    }
    
    func testLoadDataFailure() {
        personRepository.isError = true
        personUseCase.loadData { personData, error in
            // Data is nil
            XCTAssertNil(personData, "Data is nil")
            // Error found in failed case of Data fetch
            XCTAssertNotNil(error, "\(String(describing: error?.errorMessage))")
        }
    }

}

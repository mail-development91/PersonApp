//
//  PersonDetailUseCaseTest.swift
//  DemoAppTests
//
//  Created by Amit Kumar on 05/02/24.
//

import XCTest
@testable import Person

final class PersonDetailUseCaseTest: XCTestCase {
    let personDetailRepository = MockPersonDetailRepository()
    var personDetailUseCase: PersonDetailUseCase!
    //var personList : PersonData
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        personDetailUseCase = PersonDetailUseCase(personDetailRepository)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        personDetailUseCase = nil
    }

    func testLoadImageSuccess() async throws {
        personDetailRepository.isError = false
        let data = MockPersonData().getImageData()
        personDetailUseCase.loadImage { personImage in
             XCTAssertEqual(PersonImage(data:data), personImage, "Downloaded Correct Image")
        }
    }
    
    func testLoadImageFail() async throws {
        personDetailRepository.isError = true
        personDetailUseCase.loadImage { personImage in
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

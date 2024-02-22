//
//  PersonDetailRepositoryTest.swift
//  PersonTests
//
//  Created by Amit Kumar on 21/02/24.
//

import XCTest
@testable import Person

final class PersonDetailRepositoryTest: XCTestCase {
    let personDetailService = MockPersonDetailService()
    var personDetailRepository: PersonDetailRepository!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        personDetailRepository = PersonDetailRepository(personDetailService)

    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        personDetailRepository = nil
    }

    func testLoadImageSuccess() async throws {
        personDetailService.isError = false
        let data = MockPersonData().getImageData()
        personDetailRepository.callImageService { personImage in
            XCTAssertEqual(PersonImage(data:data), personImage, "Downloaded Correct Image")
        }
    }
    
    func testLoadImageFail() async throws {
        personDetailService.isError = true
        personDetailRepository.callImageService { personImage in
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

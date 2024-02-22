//
//  PersonDetailViewModelTest.swift
//  DemoAppTests
//
//  Created by Amit Kumar on 05/02/24.
//

import XCTest
@testable import Person

final class PersonDetailViewModelTest: XCTestCase {

    //var isSuccessCalled = false
    var viewModdel : PersonDetailViewModel!
    let detailUseCase = MockPersonDetailUseCase()
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        viewModdel = PersonDetailViewModel(detailUseCase)
        //viewModdel.output = self
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        viewModdel = nil
    }

    func testLoadImageSuccess() throws {
        detailUseCase.isError = false
        viewModdel.loadImage()
        XCTAssertTrue(detailUseCase.loaded, "Image is loaded")
        
    }
    
    func testLoadImageFail() throws {
        detailUseCase.isError = true
        viewModdel.loadImage()
        XCTAssertFalse(detailUseCase.loaded, "Image is Not loaded")
        
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}

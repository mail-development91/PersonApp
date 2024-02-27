//
//  PersonDetailViewTest.swift
//  DemoAppTests
//
//  Created by Amit Kumar on 05/02/24.
//

import XCTest
import SnapshotTesting
@testable import Person


final class PersonDetailViewTest: XCTestCase {

    var perspnDetailView = PersonDetailView()
    let mockPersonData = MockPersonData().getMockReponse().data?.first
    var personDetailViewController: PersonDetailViewController!

    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        continueAfterFailure = false
        //SnapshotTesting.isRecording = true

        personDetailViewController = PersonDetailViewController()
        personDetailViewController.beginAppearanceTransition(true, animated: false)
        personDetailViewController.viewModel = MockPersonDetailViewModel(op: personDetailViewController, detail: mockPersonData!)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        personDetailViewController.endAppearanceTransition()

        
    }
    
    func testPersonViewControllerSnapshot() {
        //assertSnapshot(matching: personDetailViewController, as: .image)
    }
    
    func testPersonViewControllerFunctionTest() {
        
        personDetailViewController.showDetail()
        XCTAssertNotNil(name, "Show Result is Called !")
        
    }


    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}

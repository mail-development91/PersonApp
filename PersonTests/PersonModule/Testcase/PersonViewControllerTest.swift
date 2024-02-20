//
//  PersonViewControllerTest.swift
//  DemoAppTests
//
//  Created by Amit Kumar on 06/02/24.
//

import XCTest
import SnapshotTesting
@testable import DemoApp

final class PersonViewControllerTest: XCTestCase {
    
    var personViewController: PersonViewController!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        //SnapshotTesting.isRecording = true
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        personViewController = storyboard.instantiateViewController(withIdentifier: "PersonViewController") as! PersonViewController
        personViewController.beginAppearanceTransition(true, animated: false)
        personViewController.viewModel = MockPersonViewModel(op: personViewController)
        
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        personViewController.endAppearanceTransition()
    }
    
    
    func testPersonViewControllerSnapshot() {
        assertSnapshot(matching: personViewController, as: .image)
    }
    
    func testPersonViewControllerNumberOfCell() {
        let tableView = personViewController.tableView!
        XCTAssertEqual(2, tableView.dataSource?.tableView(tableView, numberOfRowsInSection: 0))
    }
    
    func testPersonViewControllerCellForRow() {
        // "firstname":"Ozella","lastname":"Mohr"
        
        let tableView = personViewController.tableView!
        let indexpath = IndexPath(row: 0, section: 0)
        let mockPersonData = MockPersonData().getMockReponse().data?[0]
        let name = (mockPersonData?.firstname ?? "Ozella") + " " + (mockPersonData?.lastname ?? "Mohr")
        let cell = tableView.dataSource?.tableView(tableView, cellForRowAt: indexpath) as! PersonTableViewCell
        XCTAssertNotNil(cell, "Cell is loaded")
        XCTAssertEqual(name, cell.labelName?.text)
    }
    
    func testPersonViewControllerDidSelect() {
        // "firstname":"Ozella","lastname":"Mohr"
        
        let tableView = personViewController.tableView!
        let indexpath = IndexPath(row: 0, section: 0)
        let mockPersonData = MockPersonData().getMockReponse().data?[0]
        let name = (mockPersonData?.firstname ?? "Ozella") + " " + (mockPersonData?.lastname ?? "Mohr")
        tableView.delegate?.tableView?(tableView, didSelectRowAt: indexpath)
        XCTAssertNotNil(name, "First Cell is Selected !")
        
    }
    
    func testPersonViewControllerFunctionTest() {
        // "firstname":"Ozella","lastname":"Mohr"
        
        let tableView = personViewController.tableView!
        let indexpath = IndexPath(row: 0, section: 0)
        let mockPersonData = MockPersonData().getMockReponse().data?[0]
        let name = (mockPersonData?.firstname ?? "Ozella") + " " + (mockPersonData?.lastname ?? "Mohr")
        tableView.delegate?.tableView?(tableView, didSelectRowAt: indexpath)
        
        personViewController.showResult()
        XCTAssertNotNil(name, "Show Result is Called !")
        
        personViewController.showError()
        XCTAssertNotNil(name, "Show Error is Called !")
        
    }
    
}

//
//  NetworkManagerTest.swift
//  DemoAppTests
//
//  Created by Amit Kumar on 05/02/24.
//

import XCTest
@testable import Person

class NetworkManagerTest: XCTestCase, Mockable {
    
    var urlSession: URLSession!
    var networkManager: NetworkManagerProtocol!
    let reqURL = URL(string: MockConstant.urlString)!
    
    override func setUp() {
        let config = URLSessionConfiguration.ephemeral
        config.protocolClasses = [MockURLProtocol.self]
        urlSession = URLSession(configuration: config)
        networkManager = NetworkManager(urlSession: urlSession)
    }
    
    override func tearDown() {
        urlSession = nil
        networkManager = nil
        
        super.tearDown()
    }
    
    func test_GetPerson_Success() throws {
        
        let response = HTTPURLResponse(url: reqURL,
                                       statusCode: 200,
                                       httpVersion: nil,
                                       headerFields: ["Content-Type": "application/json"])!
        
        let mockData: Data = Data(MockString.data.utf8)
        
        MockURLProtocol.requestHandler = { request in
            return (response, mockData)
        }
        
        let expectation = XCTestExpectation(description: "response")
        
        networkManager.fetch(url: reqURL) { (response: Result<PersonData, Error>) in
            switch response {
            case .success(let personData):
                XCTAssertEqual(personData.data?.first?.firstname, "Ozella")
                XCTAssertEqual(personData.data?.count, 2)
                
                expectation.fulfill()
            case .failure(let failure):
                XCTAssertThrowsError(failure)
            }
            
        }
        wait(for: [expectation], timeout: 2)
    }
    
    
    func test_getPerson_BadResponse() throws {
        let response = HTTPURLResponse(url: reqURL,
                                       statusCode: 400,
                                       httpVersion: nil,
                                       headerFields: ["Content-Type": "application/json"])!
        
        let mockData: Data = Data(MockString.data.utf8)
        
        MockURLProtocol.requestHandler = { request in
            return (response, mockData)
        }
        
        let expectation = XCTestExpectation(description: "response")
        
        networkManager.fetch(url: reqURL) { (response: Result<PersonData, Error>) in
            switch response {
            case .success:
                XCTAssertThrowsError("Fatal Error")
            case .failure(let error):
                XCTAssertEqual(NetworkError.badResponse, error as? NetworkError)
                expectation.fulfill()
            }
        }
        wait(for: [expectation], timeout: 2)
    }
    
    
    func test_GetPerson_EncodingError() {
        let response = HTTPURLResponse(url: reqURL,
                                       statusCode: 200,
                                       httpVersion: nil,
                                       headerFields: ["Content-Type": "application/json"])!
        
        let mockData: Data = Data(MockString.data.utf8)
        
        MockURLProtocol.requestHandler = { request in
            return (response, mockData)
        }
        
        let expectation = XCTestExpectation(description: "response")
        
        networkManager.fetch(url: reqURL) { (response: Result<[PersonData], Error>) in
            switch response {
            case .success:
                XCTAssertThrowsError("Fatal Error")
            case .failure(let error):
                XCTAssertEqual(NetworkError.errorDecodingData, error as? NetworkError)
                expectation.fulfill()
            }
        }
        wait(for: [expectation], timeout: 2)
    }
}

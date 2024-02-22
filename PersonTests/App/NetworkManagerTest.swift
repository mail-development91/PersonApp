//
//  NetworkManagerTest.swift
//  DemoAppTests
//
//  Created by Amit Kumar on 05/02/24.
//

import XCTest
@testable import Person

class NetworkManagerTest: XCTestCase, Mockable {
    //var bundle: Bundle
    
    
    var urlSession: URLSession!
    var networkManager: NetworkManagerProtocol!
    let reqURL = URL(string: "https://fakerapi.it/api/v1/persons")!
    
    let mockString =
        """
        {
          "status": "OK",
          "code": 200,
          "total": 2,
          "data": [
            {
              "id": 1,
              "firstname": "Ozella",
              "lastname": "Mohr",
              "email": "nheathcote@donnelly.net",
              "phone": "+8048507328071",
              "birthday": "2010-10-22",
              "gender": "female",
              "address": {
                "id": 0,
                "street": "50250 Hackett Summit Apt. 637",
                "streetName": "Hagenes Skyway",
                "buildingNumber": "653",
                "city": "Madonnaberg",
                "zipcode": "96711",
                "country": "Portugal",
                "county_code": "CK",
                "latitude": -45.803544,
                "longitude": -84.361853
              },
              "website": "http://bayer.com",
              "image": "http://placeimg.com/640/480/people"
            },
            {
              "id": 2,
              "firstname": "Amalia",
              "lastname": "Gaylord",
              "email": "becker.jaylen@jerde.info",
              "phone": "+3807256116260",
              "birthday": "2021-02-11",
              "gender": "female",
              "address": {
                "id": 0,
                "street": "561 Feil Heights",
                "streetName": "Borer Forest",
                "buildingNumber": "6128",
                "city": "West Angel",
                "zipcode": "62409",
                "country": "Saint Pierre and Miquelon",
                "county_code": "NR",
                "latitude": -54.250563,
                "longitude": -128.890868
              },
              "website": "http://romaguera.biz",
              "image": "http://placeimg.com/640/480/people"
            }
          ]
        }
        """
    
    override func setUp() {
        let config = URLSessionConfiguration.ephemeral
        config.protocolClasses = [MockURLProtocol.self]
        urlSession = URLSession(configuration: config)
        networkManager = NetworkManager(urlsession: urlSession)
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
        
        let mockData: Data = Data(mockString.utf8)
        
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
        
        let mockData: Data = Data(mockString.utf8)
        
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
        
        let mockData: Data = Data(mockString.utf8)
        
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

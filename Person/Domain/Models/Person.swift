//
//  Person.swift
//  DemoApp
//
//  Created by Amit Kumar on 06/01/24.
//

import Foundation
import Alamofire

struct PersonError {
    let errorMessage : String?
    let errorCode: Int?
    
    init(_ error: AFError?) {
        errorCode = error?.responseCode
        errorMessage = error?.errorDescription
    }
    
    init(errorCode: Int?, errorMessage: String?) {
        self.errorMessage = errorMessage
        self.errorCode = errorCode
    }
}

struct PersonData: Codable {
    let status: String?
    let code: Int?
    let total: Int?
    let data: [Person]?
}

struct Person: Codable {
    let firstname: String?
    let lastname: String?
    let email: String?
    let phone: String?
    let birthday: String?
    let gender: String?
    let website: String?
    let image: String?
    let address: Address?
}

struct Address: Codable {
    let street: String?
    let streetName: String?
    let buildingNumber: String?
    let city: String?
    let zipcode: String?
    let country: String?
    let county_code: String?
    let latitude: Float?
    let longitude: Float?
}

struct PersonImage {
    var image: UIImage?
    
    init(data: Data?) {
        if let image = data {
            self.image = UIImage(data: image, scale:1)
        }
    }
}


/*
        {
            "id": 1,
            "firstname": "Anahi",
            "lastname": "Bailey",
            "email": "bonnie38@gmail.com",
            "phone": "+7123361323901",
            "birthday": "2006-11-30",
            "gender": "female",
            "address": {
                "id": 0,
                "street": "4949 Abernathy Mountains Suite 032",
                "streetName": "Beatrice Ports",
                "buildingNumber": "90093",
                "city": "West Lori",
                "zipcode": "28182-0234",
                "country": "Bolivia",
                "county_code": "CD",
                "latitude": 86.515479,
                "longitude": 172.847493
            },
            "website": "http://balistreri.com",
            "image": "http://placeimg.com/640/480/people"
        }
*/

//
//  Person.swift
//  DemoApp
//
//  Created by Amit Kumar on 06/01/24.
//

import Foundation
import UIKit

struct PersonError {
    let errorMessage : String?
    let errorCode: Int?
        
    init(_ error: Error?) {
        errorCode = 0
        errorMessage = error?.localizedDescription
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
    
    func getAddress() -> String {
        let buildingNumber = address?.buildingNumber ?? ConstantString.empty
        let streetName = address?.streetName ?? ConstantString.empty
        let street = address?.street ?? ConstantString.empty
        let city = address?.city ?? ConstantString.empty
        let addressString = buildingNumber + ConstantString.comma +
                            streetName + ConstantString.comma +
                            street + ConstantString.comma +
                            city
        return addressString
    }
    
    func getName() -> String {
        return (firstname ?? ConstantString.empty) + ConstantString.space +
                (lastname ?? ConstantString.empty)
    }
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

struct PersonImage: Sendable, Equatable {
    var image: UIImage?
    
    init(data: Data?) {
        if let image = data {
            self.image = UIImage(data: image, scale:1)
        }
    }
}

//
//  MockConstant.swift
//  PersonTests
//
//  Created by Amit Kumar on 27/02/24.
//

import Foundation

enum FileExtensionType: String {
    case json = "json"
}


struct MockConstant {
    static let fileName = "PersonData"
    static let imageName = "MockImage"
    static let imageType = "png"

    static let errorCode = 501
    static let errorMessage = "Person List not Found !!"
    static let errorCode2 = 502
    static let errorMessage2 = "Something went wrong !!"

    static let urlString = "https://fakerapi.it/api/v1/persons"
    
}

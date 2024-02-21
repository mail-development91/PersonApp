//
//  AFError+Extention.swift
//  Person
//
//  Created by Amit Kumar on 16/02/24.
//

import Foundation
import Alamofire

extension AFError {
    /// Error Model used in Network response
    /// - Returns: as Object of PersonError
    func error() -> PersonError {
        return PersonError(self)
    }
}

//
//  Constant.swift
//  DemoApp
//
//  Created by Amit Kumar on 12/01/24.
//

import Foundation

/// Constant used in App
struct Constant {
    static let Ok = "Ok"
    static let Main = "Main"
    static let ErrorMessage = "Somthing went wrong"
}

/// Constant used in Network Layer
struct NetworkConstants {
    static let url = "https://fakerapi.it/api/v1/persons"
    static let nameQuantity = "_quantity"
    static let valueQuantity = "100"
    static let nameLocale = "_locale"
    static let valueLocale = "en_US"
    static let nameGender = "_gender"
    static let valueGender = "female"
    static let imageURL = "https://lorempokemon.fakerapi.it/pokemon/250/150"
    static let params = [
        nameQuantity: valueQuantity,
        nameGender: valueGender,
        nameLocale: valueLocale
    ]
}

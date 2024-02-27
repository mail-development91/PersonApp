//
//  Constant.swift
//  DemoApp
//
//  Created by Amit Kumar on 12/01/24.
//

import Foundation

/// Constant used in App
struct AppConstant {
    static let Ok = "Ok"
    static let ErrorMessage = "Somthing went wrong"
    static let title = "List"
    static let fontSize : CGFloat = 18
}

/// All the String Constant
struct ConstantString {
    static let name = "Name:"
    static let gender = "Gender:"
    static let DOB = "DOB:"
    static let mobile = "Mobile:"
    static let address = "Address:"
    static let empty = ""
    static let space = " "
    static let comma = ", "
}

/// All constant value
struct ConstantValue {
    static let cellheight : CGFloat = 60
    static let cellCount : Int = 0
    static let navigationColor : CGFloat = 230/255
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

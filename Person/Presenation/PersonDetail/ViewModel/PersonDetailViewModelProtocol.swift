//
//  PersonViewModelProtocol.swift
//  DemoApp
//
//  Created by Amit Kumar on 06/01/24.
//

import Foundation

protocol PersonDetailViewModelProtocol {
    var output: PersonDetailOutputProtocol? {get set}
    var personDetail : Person? {get set}
    /// To Load Image
    func loadImage()
}

//
//  PersonViewModelProtocol.swift
//  DemoApp
//
//  Created by Amit Kumar on 06/01/24.
//

import Foundation

/// PersonDetailViewModelProtocol
protocol PersonDetailViewModelProtocol {
    
    /// PersonDetailOutputProtocol - output
    var output: PersonDetailOutputProtocol? {get set}
        
    /// personDetail - for image data
    var personDetail : Person? {get set}
    
    /// To Load Image
    func loadImage()
}

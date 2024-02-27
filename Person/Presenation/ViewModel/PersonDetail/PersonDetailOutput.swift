//
//  PersonOutput.swift
//  DemoApp
//
//  Created by Amit Kumar on 07/01/24.
//

import Foundation

/// PersonDetailOutputProtocol
protocol PersonDetailOutputProtocol {
    
    /// To show Detail
    func showDetail()
    
    /// /// To Load Image and Show on DetailView
    /// - Parameter image: Image Object
    func showImage(_ image: PersonImage?)
}

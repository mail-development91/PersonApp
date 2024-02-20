//
//  UINavigationController.swift
//  DemoApp
//
//  Created by Amit Kumar on 12/01/24.
//

import UIKit

extension UINavigationController {
    
    /// Methods- get()  - To get current Navigation Controller
    /// - Returns: this method return the Current Navigation controller
    static func get() -> UINavigationController {
        let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
        guard let navigation = windowScene?.windows.first?.rootViewController as? UINavigationController else {
            fatalError("Fail To Load Detail")
        }
        return navigation
    }
}

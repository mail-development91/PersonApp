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
        navigation.setAppearance()
        return navigation
    }
    
    /// Customize the appearnce of Nativation bar
    func setAppearance() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor(red: 225/255, green: 235/255, blue: 230/255, alpha: 1)
        self.navigationBar.standardAppearance = appearance
        self.navigationBar.scrollEdgeAppearance = self.navigationBar.standardAppearance
    }
}



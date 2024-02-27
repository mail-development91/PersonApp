//
//  Alert.swift
//  Person
//
//  Created by Amit Kumar on 15/02/24.
//

import Foundation
import UIKit

protocol AlertProtocol {
    
    /// To show the Alert to the user when some error occurs
    /// - Parameters:
    ///   - title: Title of alert message
    ///   - message: message discription of alert
    ///   - controller: on the view controller it should be shown
    func showAlert(title: String?,
                   message: String?,
                   on controller: UIViewController)
}

extension AlertProtocol {
    
    /// To show the Alert to the user when some error occurs
    /// - Parameters:
    ///   - title: Title of alert message
    ///   - message: message discription of alert
    ///   - controller: on the view controller it should be shown
    func showAlert(title: String? = nil,
                   message: String?,
                   on controller: UIViewController) {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: AppConstant.Ok,
                                      style: .cancel))
        DispatchQueue.main.async {
            controller.present(alert, animated: true)
        }
    }
}

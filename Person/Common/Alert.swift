//
//  Alert.swift
//  Person
//
//  Created by Amit Kumar on 15/02/24.
//

import Foundation
import UIKit

protocol AlertProtocol {
    func showAlert(title: String?,
                   message: String?,
                   on controller: UIViewController)
}

extension AlertProtocol {
    func showAlert(title: String? = nil,
                   message: String?,
                   on controller: UIViewController) {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: Constant.Ok,
                                      style: .cancel))
        controller.present(alert, animated: true)
    }
}

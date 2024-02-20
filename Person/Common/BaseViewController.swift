//
//  BaseViewController.swift
//  DemoApp
//
//  Created by Amit Kumar on 07/01/24.
//

import UIKit

/// BaseViewController - All other viewcontroller will inherit the BaseViewController
class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

extension UIViewController
{
    /// This Method intantiate the ViewController.
    /// - Parameter name: name of Storyboard. By default it will intantiate from Main Storyboard.
    /// - Returns: It return the Object of ViewController which user wants to intantiate.
    class func instantiateFromStoryboard(_ name: String = Constant.Main) -> Self
    {
        return instantiateFromStoryboardHelper(name)
    }
    
    /// This Method intantiate the ViewController.
    /// - Parameter name: name of Storyboard.
    /// - Returns: It return the Object of ViewController which user wants to intantiate.
    fileprivate class func instantiateFromStoryboardHelper<T>(_ name: String) -> T
    {
        let storyboard = UIStoryboard(name: name, bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: String(describing: self)) as! T
        return controller
    }
}

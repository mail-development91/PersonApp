//
//  PersonDetailViewController.swift
//  DemoApp
//
//  Created by Amit Kumar on 05/01/24.
//

import UIKit

/// PersonDetailViewController class
final class PersonDetailViewController: UIViewController {
    
    /// detail view object
    private var detailView = PersonDetailView()
    
    /// detail view model
    var viewModel: PersonDetailViewModelProtocol?
    
    /// viewDidLoad method
    override func viewDidLoad() {
        super.viewDidLoad()
        showDetail()
    }
    
    /// viewWillAppear - of PersonDetailViewController
    /// - Parameter animated: true or false param
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.view.addSubview(detailView)
        detailView.backgroundColor = UIColor.white
        detailView.frame = CGRectMake(0 ,
                                      0,
                                      self.view.frame.width,
                                      self.view.frame.height)
    }
}

extension PersonDetailViewController: PersonDetailOutputProtocol{
    
    /// Show image once received
    /// - Parameter image: image data
    func showImage(_ image: PersonImage?) {
        detailView.showImage(image)
    }
    
    
    /// Show detail screen
    func showDetail() {
        self.title = viewModel?.personDetail?.firstname
        detailView.configureData(person: viewModel?.personDetail);
        detailView.loadImage(viewModel)
    }
}

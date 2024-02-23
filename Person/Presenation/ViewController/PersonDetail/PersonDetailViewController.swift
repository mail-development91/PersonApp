//
//  PersonDetailViewController.swift
//  DemoApp
//
//  Created by Amit Kumar on 05/01/24.
//

import UIKit

final class PersonDetailViewController: UIViewController {
    private var detailView = PersonDetailView()
    var viewModel: PersonDetailViewModelProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showDetail()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.view.addSubview(detailView)
        detailView.backgroundColor = UIColor.white
        detailView.frame = CGRectMake(0 , 0, self.view.frame.width, self.view.frame.height)
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

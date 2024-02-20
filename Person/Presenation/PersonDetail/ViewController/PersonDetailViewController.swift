//
//  PersonDetailViewController.swift
//  DemoApp
//
//  Created by Amit Kumar on 05/01/24.
//

import UIKit

final class PersonDetailViewController: BaseViewController {
    @IBOutlet var detailView: PersonDetailView!
    var viewModel: PersonDetailViewModelProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showDetail()
        // Do any additional setup after loading the view.
    }
}

extension PersonDetailViewController: PersonDetailOutputProtocol{
    func showImage(_ image: PersonImage?) {
        detailView.showImage(image)
    }
    
    func showDetail() {
        detailView.configureData(person: viewModel?.personDetail);
        detailView.loadImage(viewModel)
    }
}

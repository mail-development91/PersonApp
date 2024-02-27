//
//  PersonViewModel.swift
//  DemoApp
//
//  Created by Amit Kumar on 06/01/24.
//

import Foundation

final class PersonDetailViewModel: PersonDetailViewModelProtocol {
    
    /// personDetail - to show image in detail screen
    var personDetail : Person?
    
    /// output - to show the output
    var output: PersonDetailOutputProtocol?
    
    /// usecase - business logic
    private let useCase: PersonDetailUseCaseProtocol?
    
    /// PersonDetailViewModel initializer
    /// - Parameter useCase: business logic for PersonDetailViewModel
    init(_ useCase: PersonDetailUseCaseProtocol) {
        self.useCase = useCase
    }
    
    /// To Load Image and Show on DetailView
    func loadImage() {
        useCase?.loadImage(completion: { personImage in
            guard let image = personImage else {
                return
            }
            self.output?.showImage(image)
        })
    }
}

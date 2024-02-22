//
//  PersonViewModel.swift
//  DemoApp
//
//  Created by Amit Kumar on 06/01/24.
//

import Foundation

final class PersonDetailViewModel: PersonDetailViewModelProtocol {
    var personDetail : Person?
    var output: PersonDetailOutputProtocol?
    private let useCase: PersonDetailUseCaseProtocol?
    
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

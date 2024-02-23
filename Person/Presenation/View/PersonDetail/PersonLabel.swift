//
//  PersonLabel.swift
//  Person
//
//  Created by Amit Kumar on 19/02/24.
//

import UIKit

final class PersonLabel: UILabel {
    
    /// Initilizer method
    /// - Parameter aDecoder: nscoder type
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initializeLabel()
    }
    
    /// Initilizer method
    /// - Parameter frame: initial frame
    override init(frame: CGRect) {
        super.init(frame: frame)
        initializeLabel()
    }
    
    /// Initilizer method
    /// - Parameter text: text to be shown
    init(text: String?) {
        super.init(frame: CGRectZero)
        self.text = text
        initializeLabel()
    }

    /// Initilizer method
    private func initializeLabel() {
        self.textAlignment = .left
        self.font = UIFont.systemFont(ofSize: 18)
        self.textColor = .black
    }
}

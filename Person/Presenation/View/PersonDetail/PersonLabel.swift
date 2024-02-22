//
//  PersonLabel.swift
//  Person
//
//  Created by Amit Kumar on 19/02/24.
//

import UIKit

final class PersonLabel: UILabel {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initializeLabel()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        initializeLabel()
    }
    
    init(text: String?) {
        super.init(frame: CGRectZero)
        self.text = text
        initializeLabel()
    }

    private func initializeLabel() {
        self.textAlignment = .left
        self.font = UIFont.systemFont(ofSize: 18)
        self.textColor = .black
    }
}

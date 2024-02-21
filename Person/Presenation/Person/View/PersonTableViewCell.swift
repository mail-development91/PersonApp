//
//  PersonTableViewCell.swift
//  DemoApp
//
//  Created by Amit Kumar on 04/01/24.
//

import UIKit

final class PersonTableViewCell: UITableViewCell {
    var labelName = PersonLabel()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCell.CellStyle = UITableViewCell.CellStyle.default, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(labelName)
        labelName.translatesAutoresizingMaskIntoConstraints = false
        labelName.leftAnchor.constraint(equalTo: leftAnchor, constant: 20).isActive = true
        labelName.rightAnchor.constraint(equalTo: rightAnchor, constant: 20).isActive = true
        labelName.topAnchor.constraint(equalTo: topAnchor).isActive = true
        labelName.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    func configureCell(person: Person?) {
        labelName.text = (person?.firstname ?? "") + " " + (person?.lastname ?? "")
    }
}

//
//  PersonTableViewCell.swift
//  DemoApp
//
//  Created by Amit Kumar on 04/01/24.
//

import UIKit

final class PersonTableViewCell: UITableViewCell {
    private var labelName = PersonLabel()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// initilizer called when needed to initilize
    /// - Parameters:
    ///   - style: be default type
    ///   - reuseIdentifier: reuse identifier needed to initilize
    override init(style: UITableViewCell.CellStyle = UITableViewCell.CellStyle.default, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(labelName)
        labelName.translatesAutoresizingMaskIntoConstraints = false
        labelName.leftAnchor.constraint(equalTo: leftAnchor, constant: 20).isActive = true
        labelName.rightAnchor.constraint(equalTo: rightAnchor, constant: 20).isActive = true
        labelName.topAnchor.constraint(equalTo: topAnchor).isActive = true
        labelName.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    /// Configure the cell with data
    /// - Parameter person: configure the person data
    func configureCell(person: Person?) {
        labelName.text = (person?.firstname ?? "") + " " + (person?.lastname ?? "")
    }
}

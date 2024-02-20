//
//  PersonTableViewCell.swift
//  DemoApp
//
//  Created by Amit Kumar on 04/01/24.
//

import UIKit

class PersonTableViewCell: UITableViewCell {
    @IBOutlet weak var labelName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func configureCell(person: Person?) {
        labelName.text = (person?.firstname ?? "") + " " + (person?.lastname ?? "")
    }
}

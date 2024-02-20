//
//  PersonTableViewCell.swift
//  DemoApp
//
//  Created by Amit Kumar on 04/01/24.
//

import UIKit
import Alamofire

final class PersonDetailView: UIView {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelGender: UILabel!
    @IBOutlet weak var labelDOB: UILabel!
    @IBOutlet weak var labelMobile: UILabel!
    @IBOutlet weak var labelAddress: UILabel!
    
    func configureData(person:Person?) {
        labelName.text = (person?.firstname ?? "") + " " + (person?.lastname ?? "")
        labelGender.text = person?.gender
        labelDOB.text = person?.birthday
        labelMobile.text = person?.phone
        labelAddress.text = getAddress(person: person)
    }
    
    func getAddress(person: Person?) -> String {
        let address = person?.address
        let buildingNumber = address?.buildingNumber ?? ""
        let streetName = address?.streetName ?? ""
        let street = address?.street ?? ""
        let city = address?.city ?? ""
        let addressString = buildingNumber + ", " + streetName + ", " + street + ", " + city
        return addressString
    }
    
    func loadImage(_ viewModel: PersonDetailViewModelProtocol?) {
        viewModel?.loadImage()
    }
    
    func showImage(_ imageModel: PersonImage?) {
        imageView.image =  imageModel?.image
    }
}


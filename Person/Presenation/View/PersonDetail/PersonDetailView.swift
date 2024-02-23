//
//  PersonTableViewCell.swift
//  DemoApp
//
//  Created by Amit Kumar on 04/01/24.
//

import UIKit

final class PersonDetailView: UIView {
    // properties for layout spaces & margins
    private let left: CGFloat = 40
    private let right: CGFloat = -40
    private let top: CGFloat = 10
    private let margin: CGFloat = 20
    private let labelWidth: CGFloat = 100
    private let labelHeight: CGFloat = 30
    private let imageWidth: CGFloat = 320
    private let imageHeight: CGFloat = 250
    
    // Labels for Person Details
    private var imageView = UIImageView()
    private var labelName = PersonLabel(text: Constant.name)
    private var labelGender = PersonLabel(text: Constant.gender)
    private var labelDOB = PersonLabel(text: Constant.DOB)
    private var labelMobile = PersonLabel(text: Constant.mobile)
    private var labelAddress = PersonLabel(text: Constant.address)
    private var labelNameValue = PersonLabel()
    private var labelGenderValue = PersonLabel()
    private var labelDOBValue = PersonLabel()
    private var labelMobileValue = PersonLabel()
    private var labelAddressValue = PersonLabel()
    
    /// configure the view based on data provided
    /// - Parameter person: person data which needs to be shown on view
    func configureData(person:Person?) {
        setupView()
        labelNameValue.text = (person?.firstname ?? "") + " " + (person?.lastname ?? "")
        labelGenderValue.text = person?.gender
        labelDOBValue.text = person?.birthday
        labelMobileValue.text = person?.phone
        labelAddressValue.text = person?.getAddress()
    }
    
    /// image needs to be loaded from the network
    /// - Parameter viewModel: viewModel is comunicated to load the image
    func loadImage(_ viewModel: PersonDetailViewModelProtocol?) {
        viewModel?.loadImage()
    }
    
    
    /// Show the image once it is downloaded
    /// - Parameter imageModel: image data which is downloaded, to be shown on screen
    func showImage(_ imageModel: PersonImage?) {
        DispatchQueue.main.async {
            self.imageView.image =  imageModel?.image
        }
    }
}

extension PersonDetailView {
    
    /// to setup the view, add as subview and set he autolayout
    private func setupView() {
        self.addSubview(imageView)
        self.addSubview(labelName)
        self.addSubview(labelGender)
        self.addSubview(labelDOB)
        self.addSubview(labelMobile)
        self.addSubview(labelAddress)
        self.addSubview(labelNameValue)
        self.addSubview(labelGenderValue)
        self.addSubview(labelDOBValue)
        self.addSubview(labelMobileValue)
        self.addSubview(labelAddressValue)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor).isActive = true
        imageView.centerYAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 170).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: imageWidth).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: imageHeight).isActive = true
        imageView.layer.borderWidth = 0.5
        imageView.layer.cornerRadius = 5.0
        imageView.layer.borderColor = UIColor.gray.cgColor
                
        labelName.translatesAutoresizingMaskIntoConstraints = false
        labelName.widthAnchor.constraint(equalToConstant: labelWidth).isActive = true
        labelName.heightAnchor.constraint(equalToConstant: labelHeight).isActive = true
        labelName.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor, constant: left).isActive = true
        labelName.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: top).isActive = true
        
        labelGender.translatesAutoresizingMaskIntoConstraints = false
        labelGender.widthAnchor.constraint(equalToConstant: labelWidth).isActive = true
        labelGender.heightAnchor.constraint(equalToConstant: labelHeight).isActive = true
        labelGender.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor, constant: left).isActive = true
        labelGender.topAnchor.constraint(equalTo: labelName.bottomAnchor, constant: top).isActive = true
        
        labelDOB.translatesAutoresizingMaskIntoConstraints = false
        labelDOB.widthAnchor.constraint(equalToConstant: labelWidth).isActive = true
        labelDOB.heightAnchor.constraint(equalToConstant: labelHeight).isActive = true
        labelDOB.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor, constant: left).isActive = true
        labelDOB.topAnchor.constraint(equalTo: labelGender.bottomAnchor, constant: top).isActive = true
        
        labelMobile.translatesAutoresizingMaskIntoConstraints = false
        labelMobile.widthAnchor.constraint(equalToConstant: labelWidth).isActive = true
        labelMobile.heightAnchor.constraint(equalToConstant: labelHeight).isActive = true
        labelMobile.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor, constant: left).isActive = true
        labelMobile.topAnchor.constraint(equalTo: labelDOB.bottomAnchor, constant: top).isActive = true
        
        labelAddress.translatesAutoresizingMaskIntoConstraints = false
        labelAddress.widthAnchor.constraint(equalToConstant: labelWidth).isActive = true
        labelAddress.heightAnchor.constraint(equalToConstant: labelHeight).isActive = true
        labelAddress.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor, constant: left).isActive = true
        labelAddress.topAnchor.constraint(equalTo: labelMobile.bottomAnchor, constant: top).isActive = true
        
        
        labelNameValue.translatesAutoresizingMaskIntoConstraints = false
        labelNameValue.leftAnchor.constraint(equalTo: labelName.rightAnchor, constant: margin).isActive = true
        labelNameValue.heightAnchor.constraint(equalToConstant: labelHeight).isActive = true
        labelNameValue.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor, constant: right).isActive = true
        labelNameValue.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: top).isActive = true
        
        labelGenderValue.translatesAutoresizingMaskIntoConstraints = false
        labelGenderValue.leftAnchor.constraint(equalTo: labelGender.rightAnchor, constant: margin).isActive = true
        labelGenderValue.heightAnchor.constraint(equalToConstant: labelHeight).isActive = true
        labelGenderValue.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor, constant: right).isActive = true
        labelGenderValue.topAnchor.constraint(equalTo: labelNameValue.bottomAnchor, constant: top).isActive = true
        
        labelDOBValue.translatesAutoresizingMaskIntoConstraints = false
        labelDOBValue.leftAnchor.constraint(equalTo: labelDOB.rightAnchor, constant: margin).isActive = true
        labelDOBValue.heightAnchor.constraint(equalToConstant: labelHeight).isActive = true
        labelDOBValue.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor, constant: right).isActive = true
        labelDOBValue.topAnchor.constraint(equalTo: labelGenderValue.bottomAnchor, constant: top).isActive = true
        
        labelMobileValue.translatesAutoresizingMaskIntoConstraints = false
        labelMobileValue.leftAnchor.constraint(equalTo: labelMobile.rightAnchor, constant: margin).isActive = true
        labelMobileValue.heightAnchor.constraint(equalToConstant: labelHeight).isActive = true
        labelMobileValue.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor, constant: right).isActive = true
        labelMobileValue.topAnchor.constraint(equalTo: labelDOBValue.bottomAnchor, constant: top).isActive = true
        
        labelAddressValue.numberOfLines = 0
        labelAddressValue.translatesAutoresizingMaskIntoConstraints = false
        labelAddressValue.leftAnchor.constraint(equalTo: labelAddress.rightAnchor, constant: margin).isActive = true
        labelAddressValue.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor, constant: right).isActive = true
        labelAddressValue.topAnchor.constraint(equalTo: labelMobileValue.bottomAnchor, constant: top).isActive = true
    }
}

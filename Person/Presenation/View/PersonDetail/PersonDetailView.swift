//
//  PersonTableViewCell.swift
//  DemoApp
//
//  Created by Amit Kumar on 04/01/24.
//

import UIKit

/// PersonDetailView screen
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
    private let constraintYImageView: CGFloat = 170
    private let borderWidthImageView: CGFloat = 0.5
    private let cornerRadiusImageView: CGFloat = 0.5
    private let numberOfLines: Int = 0
    
    // Labels for Person Details
    private var imageView = UIImageView()
    private var labelName = PersonLabel(text: ConstantString.name)
    private var labelGender = PersonLabel(text: ConstantString.gender)
    private var labelDOB = PersonLabel(text: ConstantString.DOB)
    private var labelMobile = PersonLabel(text: ConstantString.mobile)
    private var labelAddress = PersonLabel(text: ConstantString.address)
    private var labelNameValue = PersonLabel()
    private var labelGenderValue = PersonLabel()
    private var labelDOBValue = PersonLabel()
    private var labelMobileValue = PersonLabel()
    private var labelAddressValue = PersonLabel()
    
    /// configure the view based on data provided
    /// - Parameter person: person data which needs to be shown on view
    func configureData(person:Person?) {
        setupSubViews()
        labelNameValue.text = person?.getName()
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
    
    /// To Setup subviews
    private func setupSubViews() {
        setupImageView()
        setupLabelName()
        setupLabelGender()
        setupLabelDOB()
        setupLabelMobile()
        setupLabelAddress()
        setupLabelNameValue()
        setupLabelGenderValue()
        setupLabelDOBValue()
        setupLabelMobileValue()
        setupLabelAddressValue()
    }
    
    /// To Setup imageView
    private func setupImageView() {
        self.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor).isActive = true
        imageView.centerYAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: constraintYImageView).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: imageWidth).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: imageHeight).isActive = true
        imageView.layer.borderWidth = borderWidthImageView
        imageView.layer.cornerRadius = cornerRadiusImageView
        imageView.layer.borderColor = UIColor.gray.cgColor
    }
    
    /// To Setup labelName
    private func setupLabelName() {
        self.addSubview(labelName)
        labelName.translatesAutoresizingMaskIntoConstraints = false
        labelName.widthAnchor.constraint(equalToConstant: labelWidth).isActive = true
        labelName.heightAnchor.constraint(equalToConstant: labelHeight).isActive = true
        labelName.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor, constant: left).isActive = true
        labelName.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: top).isActive = true
    }
    
    /// To Setup labelGender
    private func setupLabelGender() {
        self.addSubview(labelGender)
        labelGender.translatesAutoresizingMaskIntoConstraints = false
        labelGender.widthAnchor.constraint(equalToConstant: labelWidth).isActive = true
        labelGender.heightAnchor.constraint(equalToConstant: labelHeight).isActive = true
        labelGender.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor, constant: left).isActive = true
        labelGender.topAnchor.constraint(equalTo: labelName.bottomAnchor, constant: top).isActive = true
    }
    
    /// To Setup labelDOB
    private func setupLabelDOB() {
        self.addSubview(labelDOB)
        labelDOB.translatesAutoresizingMaskIntoConstraints = false
        labelDOB.widthAnchor.constraint(equalToConstant: labelWidth).isActive = true
        labelDOB.heightAnchor.constraint(equalToConstant: labelHeight).isActive = true
        labelDOB.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor, constant: left).isActive = true
        labelDOB.topAnchor.constraint(equalTo: labelGender.bottomAnchor, constant: top).isActive = true
    }
    
    /// To Setup labelMobile
    private func setupLabelMobile() {
        self.addSubview(labelMobile)
        labelMobile.translatesAutoresizingMaskIntoConstraints = false
        labelMobile.widthAnchor.constraint(equalToConstant: labelWidth).isActive = true
        labelMobile.heightAnchor.constraint(equalToConstant: labelHeight).isActive = true
        labelMobile.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor, constant: left).isActive = true
        labelMobile.topAnchor.constraint(equalTo: labelDOB.bottomAnchor, constant: top).isActive = true
    }
    
    /// To Setup labelAddress
    private func setupLabelAddress() {
        self.addSubview(labelAddress)
        labelAddress.translatesAutoresizingMaskIntoConstraints = false
        labelAddress.widthAnchor.constraint(equalToConstant: labelWidth).isActive = true
        labelAddress.heightAnchor.constraint(equalToConstant: labelHeight).isActive = true
        labelAddress.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor, constant: left).isActive = true
        labelAddress.topAnchor.constraint(equalTo: labelMobile.bottomAnchor, constant: top).isActive = true
    }
    
    /// To Setup labelNameValue
    private func setupLabelNameValue() {
        self.addSubview(labelNameValue)
        labelNameValue.translatesAutoresizingMaskIntoConstraints = false
        labelNameValue.leftAnchor.constraint(equalTo: labelName.rightAnchor, constant: margin).isActive = true
        labelNameValue.heightAnchor.constraint(equalToConstant: labelHeight).isActive = true
        labelNameValue.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor, constant: right).isActive = true
        labelNameValue.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: top).isActive = true
    }
    
    /// To Setup labelGenderValue
    private func setupLabelGenderValue() {
        self.addSubview(labelGenderValue)
        labelGenderValue.translatesAutoresizingMaskIntoConstraints = false
        labelGenderValue.leftAnchor.constraint(equalTo: labelGender.rightAnchor, constant: margin).isActive = true
        labelGenderValue.heightAnchor.constraint(equalToConstant: labelHeight).isActive = true
        labelGenderValue.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor, constant: right).isActive = true
        labelGenderValue.topAnchor.constraint(equalTo: labelNameValue.bottomAnchor, constant: top).isActive = true
    }
    
    /// To Setup labelDOBValue
    private func setupLabelDOBValue() {
        self.addSubview(labelDOBValue)
        labelDOBValue.translatesAutoresizingMaskIntoConstraints = false
        labelDOBValue.leftAnchor.constraint(equalTo: labelDOB.rightAnchor, constant: margin).isActive = true
        labelDOBValue.heightAnchor.constraint(equalToConstant: labelHeight).isActive = true
        labelDOBValue.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor, constant: right).isActive = true
        labelDOBValue.topAnchor.constraint(equalTo: labelGenderValue.bottomAnchor, constant: top).isActive = true
    }
    
    /// To Setup labelMobileValue
    private func setupLabelMobileValue() {
        self.addSubview(labelMobileValue)
        labelMobileValue.translatesAutoresizingMaskIntoConstraints = false
        labelMobileValue.leftAnchor.constraint(equalTo: labelMobile.rightAnchor, constant: margin).isActive = true
        labelMobileValue.heightAnchor.constraint(equalToConstant: labelHeight).isActive = true
        labelMobileValue.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor, constant: right).isActive = true
        labelMobileValue.topAnchor.constraint(equalTo: labelDOBValue.bottomAnchor, constant: top).isActive = true
    }
    
    /// To Setup labelAddressValue
    private func setupLabelAddressValue() {
        self.addSubview(labelAddressValue)
        labelAddressValue.numberOfLines = numberOfLines
        labelAddressValue.translatesAutoresizingMaskIntoConstraints = false
        labelAddressValue.leftAnchor.constraint(equalTo: labelAddress.rightAnchor, constant: margin).isActive = true
        labelAddressValue.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor, constant: right).isActive = true
        labelAddressValue.topAnchor.constraint(equalTo: labelMobileValue.bottomAnchor, constant: top).isActive = true
    }
}

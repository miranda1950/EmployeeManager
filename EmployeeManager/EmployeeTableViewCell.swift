//
//  EmployeeTableViewCell.swift
//  EmployeeManager
//
//  Created by Miran on 08.06.2024..
//

import UIKit


class EmployeeTableViewCell: UITableViewCell {
    
    var employee: Employee? {
        didSet {
            guard let employee = employee else { return }
            firstNameLabel.text = employee.firstName
            lastNameLabel.text = employee.lastName
            oibLabel.text = String(employee.id)
            if let image = UIImage(data: employee.employeeImage) {
                employeeImage.image = image
            } else {
                
                print("Failed to create UIImage from Data")
            }
        }
    }
    
    private lazy var containerView: UIView = {
        let container = UIView()
        container.backgroundColor = .darkGray2
        container.layer.cornerRadius = 16
        container.layer.borderColor = UIColor.darkRed.cgColor
        container.layer.borderWidth = 2
        addSubview(container)
        return container
    }()
    
    
    private lazy var employeeImage: UIImageView = {
        let employeeImage = UIImageView()
        employeeImage.isUserInteractionEnabled = true
        employeeImage.contentMode = .scaleToFill
        employeeImage.layer.cornerRadius = 8
        employeeImage.clipsToBounds = true
        containerView.addSubview(employeeImage)
        return employeeImage
    }()
    
    
    private lazy var firstNameLabel: UILabel = {
        let firstNameLabel = UILabel()
        firstNameLabel.numberOfLines = 1
        firstNameLabel.style(color: .darkRed)
        containerView.addSubview(firstNameLabel)
        return firstNameLabel
        
    }()
    
    private lazy var lastNameLabel: UILabel = {
        let lastNameLabel = UILabel()
        lastNameLabel.numberOfLines = 1
        lastNameLabel.style( color: .darkRed)
        containerView.addSubview(lastNameLabel)
        return lastNameLabel
    }()
    
    private lazy var oibLabel: UILabel = {
        let oibLabel = UILabel()
        oibLabel.numberOfLines = 1
        oibLabel.style( color: .darkRed, alignment: .right)
        containerView.addSubview(oibLabel)
        return oibLabel
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .black
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupConstraints()
    }

    private func setupConstraints() {
        
        containerView.anchor(top: (self.topAnchor, 9),bottom: (self.bottomAnchor, 9) ,leading: (self.leadingAnchor, 20), trailing: (self.trailingAnchor, 20),size: CGSize(width: 0, height: 120))
        
        employeeImage.anchor(top: (containerView.topAnchor, 12), bottom: (containerView.bottomAnchor, 12), leading: (containerView.leadingAnchor, 12), trailing: (containerView.trailingAnchor, 200))
        
        firstNameLabel.anchor(top: (containerView.topAnchor, 12), leading: (employeeImage.trailingAnchor, 8), trailing: (containerView.trailingAnchor, 12))
        
        lastNameLabel.anchor(top: (firstNameLabel.bottomAnchor, 8), leading: (employeeImage.trailingAnchor, 8), trailing: (containerView.trailingAnchor, 12))

        
        oibLabel.anchor(bottom: (containerView.bottomAnchor, 8),leading: (employeeImage.trailingAnchor, 8), trailing: (containerView.trailingAnchor, 8))
        
    }
}



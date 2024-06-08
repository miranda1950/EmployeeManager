

import UIKit

final class DetailsViewController: UIViewController {
    
    var viewModel: DetailsViewModel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraints()
    }
    
    private lazy var employeeImage: UIImageView = {
        let employeeImage = UIImageView()
        employeeImage.layer.cornerRadius = 8
        employeeImage.image = viewModel.employeeImage
        employeeImage.clipsToBounds = true
        view.addSubview(employeeImage)
        return employeeImage
    }()
    
    private lazy var nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.text = viewModel.name
        nameLabel.numberOfLines = 0
        nameLabel.style( color: .white)
        view.addSubview(nameLabel)
        return nameLabel
    }()
    
    private lazy var lineView: UIView = {
        let line = UIView()
        line.backgroundColor = .darkRed
        view.addSubview(line)
        return line
    }()
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.backgroundColor = .black
        view.addSubview(scrollView)
        return scrollView
    }()
    
    private lazy var containerView: UIView = {
        let container = UIView()
        container.backgroundColor = .black
        scrollView.addSubview(container)
        return container
    }()
    
    private lazy var ageLabel: UILabel = {
        let ageLabel = UILabel()
        ageLabel.text = viewModel.age
        ageLabel.numberOfLines = 0
        ageLabel.style(color: .white)
        containerView.addSubview(ageLabel)
        return ageLabel
    }()
    
    private lazy var oibLabel: UILabel = {
        let oibLabel = UILabel()
        oibLabel.text = viewModel.oib
        oibLabel.numberOfLines = 0
        oibLabel.style( color: .white)
        containerView.addSubview(oibLabel)
        return oibLabel
    }()
    
    private lazy var genderLabel: UILabel = {
        let genderLabel = UILabel()
        genderLabel.text = viewModel.gender
        genderLabel.numberOfLines = 0
        genderLabel.style( color: .white)
        containerView.addSubview(genderLabel)
        return genderLabel
    }()
    
    private lazy var birthDateLabel: UILabel = {
        let birthDateLabel = UILabel()
        birthDateLabel.text = viewModel.birthDate
        birthDateLabel.numberOfLines = 0
        birthDateLabel.style( color: .white)
        containerView.addSubview(birthDateLabel)
        return birthDateLabel
    }()
    
    private lazy var startDateLabel: UILabel = {
        let startDateLabel = UILabel()
        startDateLabel.text = viewModel.startDate
        startDateLabel.numberOfLines = 0
        startDateLabel.style( color: .white)
        containerView.addSubview(startDateLabel)
        return startDateLabel
    }()
    
    private lazy var typeOfContractLabel: UILabel = {
        let typeOfContractLabel = UILabel()
        typeOfContractLabel.text = viewModel.typeOfContract
        typeOfContractLabel.numberOfLines = 0
        typeOfContractLabel.style( color: .white)
        containerView.addSubview(typeOfContractLabel)
        return typeOfContractLabel
    }()
    
    private lazy var yearsOfContractLabel: UILabel = {
        let yearsOfContractLabel = UILabel()
        yearsOfContractLabel.text = viewModel.yearsOfContract
        yearsOfContractLabel.numberOfLines = 0
        yearsOfContractLabel.style( color: .white)
        containerView.addSubview(yearsOfContractLabel)
        return yearsOfContractLabel
    }()
    
    private lazy var departmentLabel: UILabel = {
        let departmentLabel = UILabel()
        departmentLabel.text = viewModel.department
        departmentLabel.numberOfLines = 0
        departmentLabel.style( color: .white)
        containerView.addSubview(departmentLabel)
        return departmentLabel
    }()
    
    private lazy var vaccationLabel: UILabel = {
        let vaccationLabel = UILabel()
        vaccationLabel.text = viewModel.vaccationDays
        vaccationLabel.numberOfLines = 0
        vaccationLabel.style( color: .white)
        containerView.addSubview(vaccationLabel)
        return vaccationLabel
    }()
    
    private lazy var freeDaysLabel: UILabel = {
        let freeDaysLabel = UILabel()
        freeDaysLabel.text = viewModel.freeDays
        freeDaysLabel.numberOfLines = 0
        freeDaysLabel.style( color: .white)
        containerView.addSubview(freeDaysLabel)
        return freeDaysLabel
    }()
    
    private lazy var paidLeaveLabel: UILabel = {
        let paidLeaveLabel = UILabel()
        paidLeaveLabel.text = viewModel.paidLeave
        paidLeaveLabel.numberOfLines = 0
        paidLeaveLabel.style( color: .white)
        containerView.addSubview(paidLeaveLabel)
        return paidLeaveLabel
    }()
    
   
}

extension DetailsViewController {
    
    private func setupView() {
        view.backgroundColor = .black
    }
    
    private func setupConstraints() {
        
        employeeImage.anchor(top: (view.topAnchor, 0), leading: (view.leadingAnchor, 0), trailing: (view.trailingAnchor,0), size: CGSize(width: 0, height: UIScreen.main.bounds.height * 0.40))
        
        nameLabel.anchor(top: (employeeImage.bottomAnchor, 12), leading: (view.leadingAnchor, 20), trailing: (view.trailingAnchor, 20))
        lineView.anchor(top: (nameLabel.topAnchor, 0), bottom: (nameLabel.bottomAnchor, 0), size: CGSize(width: 5, height: 0))
        
        scrollView.anchor(top: (nameLabel.bottomAnchor, 8), bottom: (view.safeAreaLayoutGuide.bottomAnchor, 0),leading: (view.leadingAnchor, 0), trailing: (view.trailingAnchor,0))
        
        containerView.anchor(top: (scrollView.topAnchor, 0), bottom: (scrollView.bottomAnchor, 0), leading: (scrollView.leadingAnchor, 0), trailing: (scrollView.trailingAnchor, 0))
        
        containerView.anchor(size: CGSize(width: view.frame.width, height: 0))
        
        ageLabel.anchor(top: (containerView.topAnchor, 8),leading: (containerView.leadingAnchor, 12), trailing: (containerView.trailingAnchor, 12))
        oibLabel.anchor(top: (ageLabel.bottomAnchor, 8),leading: (containerView.leadingAnchor, 12), trailing: (containerView.trailingAnchor, 12))
        genderLabel.anchor(top: (oibLabel.bottomAnchor, 8),leading: (containerView.leadingAnchor, 12), trailing: (containerView.trailingAnchor, 12))
        birthDateLabel.anchor(top: (genderLabel.bottomAnchor, 8),leading: (containerView.leadingAnchor, 12), trailing: (containerView.trailingAnchor, 12))
        startDateLabel.anchor(top: (birthDateLabel.bottomAnchor, 8),leading: (containerView.leadingAnchor, 12), trailing: (containerView.trailingAnchor, 12))
        typeOfContractLabel.anchor(top: (startDateLabel.bottomAnchor, 8),leading: (containerView.leadingAnchor, 12), trailing: (containerView.trailingAnchor, 12))
        yearsOfContractLabel.anchor(top: (typeOfContractLabel.bottomAnchor, 8),leading: (containerView.leadingAnchor, 12), trailing: (containerView.trailingAnchor, 12))
        departmentLabel.anchor(top: (yearsOfContractLabel.bottomAnchor, 8),leading: (containerView.leadingAnchor, 12), trailing: (containerView.trailingAnchor, 12))
        vaccationLabel.anchor(top: (departmentLabel.bottomAnchor, 8),leading: (containerView.leadingAnchor, 12), trailing: (containerView.trailingAnchor, 12))
        freeDaysLabel.anchor(top: (vaccationLabel.bottomAnchor, 8),leading: (containerView.leadingAnchor, 12), trailing: (containerView.trailingAnchor, 12))
        paidLeaveLabel.anchor(top: (freeDaysLabel.bottomAnchor, 8),bottom: (containerView.bottomAnchor,8) ,leading: (containerView.leadingAnchor, 12), trailing: (containerView.trailingAnchor, 12))
        
    }
}


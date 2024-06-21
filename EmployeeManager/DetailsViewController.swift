

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
    
    
    private lazy var genderLabel: UILabel = {
        let genderLabel = UILabel()
        genderLabel.text = viewModel.gender
        genderLabel.numberOfLines = 0
        genderLabel.style( color: .white)
        containerView.addSubview(genderLabel)
        return genderLabel
    }()

    private lazy var startDateLabel: UILabel = {
        let startDateLabel = UILabel()
        startDateLabel.text = viewModel.startDate
        startDateLabel.numberOfLines = 0
        startDateLabel.style( color: .white)
        containerView.addSubview(startDateLabel)
        return startDateLabel
    }()
    
    private lazy var timeOfBirthLabel: UILabel = {
        let timeOfBirthLabel = UILabel()
        timeOfBirthLabel.text = viewModel.timeOfBirth
        timeOfBirthLabel.numberOfLines = 0
        timeOfBirthLabel.style( color: .white)
        containerView.addSubview(timeOfBirthLabel)
        return timeOfBirthLabel
    }()
   
}

extension DetailsViewController {
    
    private func setupView() {
        view.backgroundColor = .black
    }
    
    private func setupConstraints() {
        
        employeeImage.anchor(top: (view.safeAreaLayoutGuide.topAnchor, 0), leading: (view.leadingAnchor, 0), trailing: (view.trailingAnchor,0), size: CGSize(width: 0, height: UIScreen.main.bounds.height * 0.40))
        
        nameLabel.anchor(top: (employeeImage.bottomAnchor, 12), leading: (view.leadingAnchor, 20), trailing: (view.trailingAnchor, 20))
        lineView.anchor(top: (nameLabel.topAnchor, 0), bottom: (nameLabel.bottomAnchor, 0), size: CGSize(width: 5, height: 0))
        
        scrollView.anchor(top: (nameLabel.bottomAnchor, 8), bottom: (view.safeAreaLayoutGuide.bottomAnchor, 0),leading: (view.leadingAnchor, 0), trailing: (view.trailingAnchor,0))
        
        containerView.anchor(top: (scrollView.topAnchor, 0), bottom: (scrollView.bottomAnchor, 0), leading: (scrollView.leadingAnchor, 0), trailing: (scrollView.trailingAnchor, 0))
        
        containerView.anchor(size: CGSize(width: view.frame.width, height: 0))
        
        genderLabel.anchor(top: (containerView.topAnchor, 8),leading: (containerView.leadingAnchor, 12), trailing: (containerView.trailingAnchor, 12))
        startDateLabel.anchor(top: (genderLabel.bottomAnchor, 8),leading: (containerView.leadingAnchor, 12), trailing: (containerView.trailingAnchor, 12))
  
        timeOfBirthLabel.anchor(top: (startDateLabel.bottomAnchor, 8),bottom: (containerView.bottomAnchor, 8),leading: (containerView.leadingAnchor, 12), trailing: (containerView.trailingAnchor, 12))
        
    }
}


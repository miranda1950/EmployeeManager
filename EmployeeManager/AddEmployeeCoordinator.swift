//
//  AddEmployeeCoordinator.swift
//  EmployeeManager
//
//  Created by Miran on 08.06.2024..
//

import UIKit
import SwiftUI


final class AddEmployeeCoordinator: Coordinator {
    
    private let navigationController = UINavigationController()
    
    func start() -> UIViewController {
        return showAddEmployee()
    }
    
}

extension AddEmployeeCoordinator {
    
    private func showAddEmployee() -> UIViewController {
        let vm = AddEmployeeViewModel()
        let vc = UIHostingController(rootView: AddEmployeeView(viewModel: vm))
        
        vc.tabBarItem = UITabBarItem(title: "Add Employee", image: UIImage(systemName: "person"), selectedImage: UIImage(systemName: "person.fill"))
        navigationController.viewControllers = [vc]
        return navigationController
    }
    
}

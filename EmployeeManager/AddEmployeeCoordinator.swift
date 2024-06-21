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
        let vm = AddEmployeeViewModel(employeeService: ServiceFactory.employeeService, databaseService: ServiceFactory.databaseService)
        let vc = UIHostingController(rootView: AddEmployeeView(viewModel: vm))
        
        vm.onGotResponse = { [weak self] data in
            self?.goToDetails(data)
            
        }
        vc.tabBarItem = UITabBarItem(title: "Add Employee", image: UIImage(systemName: "person"), selectedImage: UIImage(systemName: "person.fill"))
        navigationController.viewControllers = [vc]
        return navigationController
    }
    
    private func goToDetails(_ data: UserData) {
        
        let vm = DetailsViewModel(employee: data)
        let vc = DetailsViewController()
        vc.viewModel = vm
        
        navigationController.pushViewController(vc, animated: true)
    }
    
}

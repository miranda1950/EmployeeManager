//
//  EmployeesCoordinator.swift
//  EmployeeManager
//
//  Created by Miran on 08.06.2024..
//

import UIKit
import SwiftUI

final class EmployeesCoordinator: Coordinator {
    
    private let navigationController = UINavigationController()
    
    func start() -> UIViewController {
        return showEmployees()
    }
    
}


extension EmployeesCoordinator {
    
    private func showEmployees() -> UIViewController {
        let vm = EmployeesViewModel(databaseService: ServiceFactory.databaseService)
        let vc = EmployeesViewController()
        vc.viewModel = vm
        
        
        vc.tabBarItem = UITabBarItem(title: "Employees", image:UIImage(systemName: "person.3"), selectedImage: UIImage(systemName: "person.3.fill"))
        
      
        vm.onGoToDetails = { [weak self] employee in
            
            self?.goToDetails(employee)
        }
        
        navigationController.viewControllers = [vc]
        return navigationController
        
    }
    
    private func goToDetails(_ employee: Employee) {
        
    }
    
}

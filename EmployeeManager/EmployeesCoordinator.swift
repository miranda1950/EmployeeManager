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
        let vm = EmployeesViewModel()
        let vc = EmployeesViewController()
        vc.viewModel = vm
        
        
        vc.tabBarItem = UITabBarItem(title: "Employees", image:UIImage(systemName: "person.3"), selectedImage: UIImage(systemName: "person.3.fill"))
        
        vm.onGoToEdit = { [weak self] employee in
            
            self?.goToEdit(employee)
        }
        
        vm.onGoToDetails = { [weak self] employee in
            
            self?.goToDetails(employee)
        }
        
        navigationController.viewControllers = [vc]
        return navigationController
        
    }
    
    
    private func goToEdit(_ employee: Employee) {
        
        let vm = EditEmployeeViewModel(employee: employee)
        let vc = UIHostingController(rootView: EditEmployeeView(viewModel: vm))
        
        
        vm.onDismissed = { [weak self] in
            
            self?.navigationController.popViewController(animated: true)
        }
        navigationController.pushViewController(vc, animated: true)
    }
    
    
    private func goToDetails(_ employee: Employee) {
        
        let vm = DetailsViewModel(employee: employee)
        let vc = DetailsViewController()
        vc.viewModel = vm
        
        navigationController.pushViewController(vc, animated: true)
    }
    
}

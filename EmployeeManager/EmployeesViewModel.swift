//
//  EmployeesViewModel.swift
//  EmployeeManager
//
//  Created by Miran on 08.06.2024..
//

import UIKit

final class EmployeesViewModel {
    
    var employees: [Employee] = []
    var onGoToDetails: ((Employee)-> Void)?
    var onGotData: EmptyCallback?
    
    var queryText: String = ""
    private let databaseService: DatabaseServiceProtocol
    
    init(databaseService: DatabaseServiceProtocol) {
        self.databaseService = databaseService
    }
    
}


extension EmployeesViewModel {
    
    func loadData() {
        
        databaseService.fetchEmployees { [weak self] result in
            switch result {
            case .success(let data):
                self?.employees = data ?? []
                self?.onGotData?()
            case .failure(let error):
                print("miranerror\(error)")
            }
        }
    }
    
    func deleteFromDatabase(_ employee: Employee) {
        
        databaseService.deleteEmployee(employee: employee)
        onGotData?()
    }
}

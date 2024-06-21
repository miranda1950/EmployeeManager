//
//  ServiceFactory.swift
//  EmployeeManager
//
//  Created by Miran on 20.06.2024..
//

import UIKit



class ServiceFactory {
    
    static var dataService: DataServiceProtocol {
        let dataService = DataService(networkConfig: NetworkConfig())
        return dataService
    }
    
    static var employeeService: EmployeeServiceProtocol {
        return EmployeeService(dataService: dataService)
    }
    
    static var databaseService: DatabaseServiceProtocol {
        return DatabaseService()
    }
}


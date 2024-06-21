//
//  DatabaseService.swift
//  EmployeeManager
//
//  Created by Miran on 21.06.2024..
//

import Foundation
import SwiftData



protocol DatabaseServiceProtocol {
    
    func saveEmployee(employee: Employee)
    func fetchEmployees(completion: @escaping(ServiceResult<[Employee]?>) -> Void)
    func deleteEmployee(employee: Employee)
}

class DatabaseService: DatabaseServiceProtocol {
    
    var container: ModelContainer?
    var context: ModelContext?
    
    
    init() {
        do {
            let schema = Schema([
                Employee.self,
            ])
            let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)
            container = try ModelContainer(for: schema, configurations: [modelConfiguration])
            if let container {
                context = ModelContext(container)
            }
        }
        catch {
            print(error)
        }
    }
    
    
    func saveEmployee(employee: Employee) {
        
        context?.insert(employee)
        
    }
    
    
    func fetchEmployees(completion: @escaping(ServiceResult<[Employee]?>) -> Void){
        
        let descriptor = FetchDescriptor<Employee>()
        
        do {
            let data = try context?.fetch(descriptor)
            completion(.success(data))
        }
        catch {
            completion(.failure(.noInternet))
        }
    }
    
    func deleteEmployee(employee: Employee) {
        let employeeToBeDeleted = employee
        
        context?.delete(employeeToBeDeleted)
    }
    
}

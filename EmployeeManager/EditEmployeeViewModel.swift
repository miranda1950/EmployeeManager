//
//  EditEmployeeViewModel.swift
//  EmployeeManager
//
//  Created by Miran on 08.06.2024..
//

import SwiftUI

final class EditEmployeeViewModel: ObservableObject {
    
    
    var employee: Employee
    
    @Published var lastName: String

    @Published var age: Int
    
    @Published  var typeOfContract: String
    let conracts = ["Neodređeno","Određeno"]
    
    @Published  var startDate: Date
    
    @Published var yearsOfContract: Int
    
    @Published var department: String
    
    @Published var vaccationDays: Int
    @Published var freeDays: Int
    @Published var paidLeave: Int
    
    @Published  var showingAlert = false
    @Published var errorMessage = ""
    var onDismissed: (()->Void)?
    
    
    init(employee: Employee) {
        self.employee = employee
        self.lastName = employee.lastName
        self.age = employee.age
        self.typeOfContract = employee.typeOfContract
        self.startDate = employee.startDate
        self.yearsOfContract = employee.yearsOfContract
        self.department = employee.department
        self.vaccationDays = employee.vaccationDays
        self.freeDays = employee.freeDays
        self.paidLeave = employee.paidLeave
    }
    
    
    func updateEmployee() {
        
        let employeeValues = Employee(id: employee.id, firstName: employee.firstName, lastName: lastName, age: age, gender: employee.gender, birthDate: employee.birthDate, startDate: startDate, typeOfContract: typeOfContract, yearsOfContract: yearsOfContract, department: department, vaccationDays: vaccationDays, freeDays: freeDays, paidLeave: paidLeave, employeeImage: employee.employeeImage)
        
        updateEmployeeInDatabase(employeeValues)
    }
    
    func updateEmployeeInDatabase(_ employeeValues: Employee) {
        
        let employeeUpdatedInTable = SQLiteCommands.updateRow(employeeValues)
        
        if employeeUpdatedInTable == true && checkValidityOfInputs() == true {
           
            print("Updated Employee")
            onDismissed?()
        } else {
            print("Error while updating")
            
            errorMessage = "Please check valid inputs"
            showingAlert = true
        }
    }
    
    func checkValidityOfInputs() -> Bool {
        
        return !lastName.isEmpty && !department.isEmpty
    }
    
}

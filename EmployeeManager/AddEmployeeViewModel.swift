//
//  AddEmployeeViewModel.swift
//  EmployeeManager
//
//  Created by Miran on 08.06.2024..
//

import UIKit
import SwiftUI
import PhotosUI

final class AddEmployeeViewModel: ObservableObject {
    
    
    @Published var firstName: String = ""
    @Published var lastName: String = ""
    
    @Published  var selectedGender: String = "M"
    let genders = ["M","F"]
    
    @Published  var startDate = Date.now
    @Published  var hours: String = ""
    @Published var minutes: String = ""
    
    
    @Published  var showingAlert = false
    @Published var errorTitle = ""
    @Published var errorMessage = ""
    
    @Published var uiImage: UIImage? = nil
    @Published var imageSelection: PhotosPickerItem? = nil
    
    var onGotResponse: ((UserData) -> Void)?
    
    private let employeeService: EmployeeServiceProtocol
    private let databaseService: DatabaseServiceProtocol
    
    init(employeeService: EmployeeServiceProtocol, databaseService: DatabaseServiceProtocol) {
        self.employeeService = employeeService
        self.databaseService = databaseService
    }
}

extension AddEmployeeViewModel {
    
    func checkValidity() {
        
        guard !firstName.isEmpty && !lastName.isEmpty  else {
            showingAlert = true
            errorTitle = "Invalid Name"
            errorMessage = "Please check if the inputs are valid"
            return
        }
        
        guard checkHoursValidity() else {
            showingAlert = true
            errorTitle = "Invalid Hours"
            errorMessage = "Please check if the hour value is valid"
            return
        }
        
        guard checkMinutesValidity() else {
            showingAlert = true
            errorTitle = "Invalid Minutes"
            errorMessage = "Please check if the minute value is valid"
            return
        }
        
        saveEmployee()
    }
    
    private func checkHoursValidity() -> Bool {
        
        return !hours.isEmpty && (0...23).contains(Int(hours) ?? 0)
    }
    
    private func checkMinutesValidity() -> Bool {
        
        return !minutes.isEmpty && (0...59).contains(Int(minutes) ?? 0)
    }
    
    private func saveEmployee() {
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let stringDate = formatter.string(from: startDate)
        
        
        employeeService.sendEmployeeData(firstName: firstName, lastName: lastName, date: stringDate, gender: selectedGender, hours: hours, minutes: minutes) { [weak self] result in
            switch result {
            case .success(let value):
                self?.saveEmployeeToDatabase(value.algorithm.userData)
                self?.onGotResponse?(value.algorithm.userData)
                self?.resetForm()
            case .failure(let error):
                print("error\(error)")
                self?.showingAlert = true
                self?.errorTitle = "API Error"
                self?.errorMessage = "There was a problem with sending request to API"
                
            }
        }
    }
    
    private func saveEmployeeToDatabase(_ employee: UserData) {
        
        let newEmployee = Employee(name: employee.name, surname: employee.surname, sex: employee.gender)
        
        databaseService.saveEmployee(employee: newEmployee)
    }
    
    func resetForm() {
        
        firstName = ""
        lastName = ""
        hours = ""
        minutes = ""
        uiImage = UIImage(systemName: "person")
    }
 
}

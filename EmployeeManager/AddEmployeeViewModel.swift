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
    let genders = ["M","F","X"]
    @Published var oib: Int = 1
    
    @Published  var birthDate = Date.now
    @Published var age: Int = 25
    
    @Published  var typeOfContract: String = "Neodređeno"
    let conracts = ["Neodređeno","Određeno"]
    
    
    @Published  var startDate = Date.now
    
    @Published var yearsOfContract: Int = 1
    
    @Published var department: String = ""
    
    @Published var vaccationDays: Int = 20
    @Published var freeDays: Int = 1
    @Published var paidLeave: Int = 1
    
    @Published  var showingAlert = false
    @Published var errorMessage = ""
    
    @Published var uiImage: UIImage? = nil
    @Published var imageSelection: PhotosPickerItem? = nil
}

extension AddEmployeeViewModel {
    
    func checkValidityOfInputs() -> Bool {
        
        return !firstName.isEmpty && !lastName.isEmpty && !String(oib).isEmpty
    }
    
    func saveEmployeeToDatabase() {
        
        guard let photo = uiImage?.pngData() else {
            return
        }
        
        
        
        let employeeValues = Employee(id: oib, firstName: firstName, lastName: lastName, age: age, gender: selectedGender, birthDate: birthDate, startDate: startDate, typeOfContract: typeOfContract, yearsOfContract: yearsOfContract, department: department, vaccationDays: vaccationDays, freeDays: freeDays, paidLeave: paidLeave, employeeImage: photo)
        
        createNewEmployee(employeeValues)
    }
    
    func createNewEmployee(_ employeeValue: Employee) {
        
        let employeeAddedToTable = SQLiteCommands.insertRow(employeeValue)
        
        if employeeAddedToTable == true && checkValidityOfInputs() == true {
            print("Employee added")
            resetForm()
        } else {
            print("Employee not added")
            errorMessage = "Please check if You correctly added first name, last name and OIB"
            showingAlert = true
        }
    }
    
    func resetForm() {
        
        firstName = ""
        lastName = ""
        oib = 1
        department = ""
        uiImage = UIImage(systemName: "person")
    }
    
    func uploadImage() {
       
    }
}

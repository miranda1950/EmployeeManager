//
//  DetailsViewModel.swift
//  EmployeeManager
//
//  Created by Miran on 08.06.2024..
//

import UIKit

final class DetailsViewModel {
    
    var employee: UserData
    
    init(employee: UserData) {
        self.employee = employee
    }
    
    let dateFormatter = DateFormatter()
    
    var employeeImage: UIImage {
        return UIImage(systemName: "person")!
    }

    var name: String {
        return "Name: " + employee.name + " " + employee.surname
    }
    
    
    var gender: String {
        
        
        return "Gender: " + employee.gender
    }
    
    var startDate: String {
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        return "Date of birth: " + employee.dateOfBirth
    }
    
    var timeOfBirth: String {
        
        return "Time Of Birth: " + employee.timeOfBirth
    }
    
}

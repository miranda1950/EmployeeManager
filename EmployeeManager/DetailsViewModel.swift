//
//  DetailsViewModel.swift
//  EmployeeManager
//
//  Created by Miran on 08.06.2024..
//

import UIKit

final class DetailsViewModel {
    
    var employee: Employee
    
    init(employee: Employee) {
        self.employee = employee
    }
    
    let dateFormatter = DateFormatter()
    
    var employeeImage: UIImage? {
        if let image = UIImage(data: employee.employeeImage) {
            return image
        } else {
            print("Failed to create UIImage from Data")
            return UIImage(systemName: "person")
        }
    }

    var name: String {
        return "Name: " + employee.firstName + " " + employee.lastName
    }
    
    var age: String {
        
        return "Age: " + String(employee.age)
    }
    
    var oib: String {
        
        return "OIB: " + String(employee.id)
    }
    
    var gender: String {
        
        
        return "Gender: " + employee.gender
    }
    
    var birthDate: String {
        
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        return "Birth date: " + dateFormatter.string(from: employee.birthDate)
    }
    
    var startDate: String {
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        return "Start date: " + dateFormatter.string(from: employee.startDate)
    }
    
    var typeOfContract: String {
        
        return "Type of contract: " + employee.typeOfContract
    }
    
    var yearsOfContract: String {
        
        
        return "Years of contract: " + String(employee.yearsOfContract)
    }
    
    var department: String {
        
        return "Department: " + employee.department
    }
    
    var vaccationDays: String {
        
        
        return "Vaccation days: " + String(employee.vaccationDays)
    }
    
    var freeDays: String {
        
        return "Free days: " + String(employee.freeDays)
    }
    
    var paidLeave: String {
        
        
        return "Paid leave: " + String(employee.paidLeave)
    }
    
}

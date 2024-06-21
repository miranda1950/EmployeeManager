//
//  Employee.swift
//  EmployeeManager
//
//  Created by Miran on 21.06.2024..
//

import SwiftData

@available(iOS 17, *)
@Model
final class Employee {
   
    let name: String
    let surname: String
    let sex: String
    
    init(name: String, surname: String, sex: String) {
        self.name = name
        self.surname = surname
        self.sex = sex
    }
}

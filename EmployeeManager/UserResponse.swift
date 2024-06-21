//
//  Employee.swift
//  EmployeeManager
//
//  Created by Miran on 08.06.2024..
//

import UIKit

struct UserResponse: Codable {
    let algorithm: Algorithm
}
 

struct Algorithm: Codable {
    let calculations: Calculations
    let components: Components
    let userData: UserData

    enum CodingKeys: String, CodingKey {
        case calculations
        case components
        case userData = "user_data"
    }
}

struct Calculations: Codable {
}

struct Components: Codable {
   
}


struct UserData: Codable {
    let dateOfBirth: String
    let gender: String
    let name: String
    let surname: String
    let timeOfBirth: String

    enum CodingKeys: String, CodingKey {
        case dateOfBirth = "date_of_birth"
        case gender
        case name
        case surname
        case timeOfBirth = "time_of_birth"
    }
}

struct Employee: Codable {
   
    let name: String
    let surname: String
    let sex: String
    let date: Date
}

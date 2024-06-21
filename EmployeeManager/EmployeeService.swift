//
//  EmployeeService.swift
//  EmployeeManager
//
//  Created by Miran on 20.06.2024..
//

import UIKit

struct EmptyDecodable: Swift.Decodable {}


protocol EmployeeServiceProtocol {
    
    func getEmployees(completion: @escaping(ServiceResult<UserResponse>) -> Void)
    
    func sendEmployeeData(firstName: String, lastName: String, date: String, gender: String, hours: String, minutes: String, completion: @escaping (ServiceResult<UserResponse>)-> Void)
}


final class EmployeeService: EmployeeServiceProtocol {
   
    private let dataService: DataServiceProtocol
    
    init(dataService: DataServiceProtocol) {
        self.dataService = dataService
    }
    
    
    func getEmployees(completion: @escaping (ServiceResult<UserResponse>) -> Void) {
        let resource = Resource<UserResponse>(
            path: "algo/firststep",
            encoding: .urlEncodedInURL,
            method: .get
        
        )
        
        dataService.fetch(resource, completion: completion)
    }
    
    
    func sendEmployeeData(firstName: String, lastName: String, date: String, gender: String, hours: String, minutes: String, completion: @escaping (ServiceResult<UserResponse>) -> Void) {
        
        let parameters: [String: Any] = ["date": date,
                                         "hour": hours,
                                         "minute": minutes,
                                         "name": firstName,
                                         "surname": lastName,
                                         "sex": gender
        ]
        let resource = Resource<UserResponse>(
        params: parameters,
        paramsPartName: "",
        files: [],
        path: "algo/firststep",
        encoding: .json,
        method: .post
        )
        
        dataService.fetch(resource, completion: completion)
    }
    
    
}


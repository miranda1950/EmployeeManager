//
//  EmployeesViewModel.swift
//  EmployeeManager
//
//  Created by Miran on 08.06.2024..
//

import UIKit

final class EmployeesViewModel {
    
    var employees: [Employee] = []
    var onGoToEdit: ((Employee)-> Void)?
    var onGoToDetails: ((Employee)-> Void)?
    
    
    var queryText: String = ""
    
    
    func connectToDatabase() {
        _ = SQLiteDatabase.sharedInstance
    }
    
     func createTable() {
        let database = SQLiteDatabase.sharedInstance
        database.createTable()
    }
    
    func loadDataFromSQLiteDatabase() {
        employees = SQLiteCommands.presentRows() ?? []
    }
    
    func deleteFromDatabase(_ employeeID: Int) {
        SQLiteCommands.deleteRow(employeeID: employeeID)
    }
    
    func searchEmployee(_ query: String) {
        
        employees = SQLiteCommands.findEmployees(withLastNameContaining: query) ?? []
        
    }
    
}

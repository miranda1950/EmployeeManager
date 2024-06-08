//
//  SQLiteCommands.swift
//  EmployeeManager
//
//  Created by Miran on 08.06.2024..
//

import UIKit


import SQLite

class SQLiteCommands {
    
    static var table = Table("employees")
    
    // Expressions
    static let id = Expression<Int>("id")
    static let firstName = Expression<String>("firstName")
    static let lastName = Expression<String>("lastName")
    static let age = Expression<Int>("age")
    static let gender = Expression<String>("gender")
    static let birthDate = Expression<Date>("birthDate")
    static let startDate = Expression<Date>("startDate")
    static let typeOfContract = Expression<String>("typeOfContract")
    static let yearsOfContract = Expression<Int>("yearsOfContract")
    static let department = Expression<String>("department")
    static let vaccationDays = Expression<Int>("vaccationDays")
    static let freeDays = Expression<Int>("freeDays")
    static let paidLeave = Expression<Int>("paidLeave")
    static let employeeImage = Expression<Data>("employeeImage")
    
    // Creating Table
    static func createTable() {
        guard let database = SQLiteDatabase.sharedInstance.database else {
            print("Datastore connection error")
            return
        }
        
        do {
            // ifNotExists: true - Will NOT create a table if it already exists
            try database.run(table.create(ifNotExists: true) { table in
                table.column(id, primaryKey: true)
                table.column(firstName)
                table.column(lastName)
                table.column(age)
                table.column(gender)
                table.column(birthDate)
                table.column(startDate)
                table.column(typeOfContract)
                table.column(yearsOfContract)
                table.column(department)
                table.column(vaccationDays)
                table.column(freeDays)
                table.column(paidLeave)
                table.column(employeeImage)
            })
        } catch {
            print("Table already exists: \(error)")
        }
    }
    
    static func insertRow(_ employeeValues:Employee) -> Bool? {
        guard let database = SQLiteDatabase.sharedInstance.database else {
            print("Datastore connection error")
            return nil
        }
        
        do {
            try database.run(table.insert(id <- employeeValues.id ,firstName <- employeeValues.firstName, lastName <- employeeValues.lastName, age <- employeeValues.age, gender <- employeeValues.gender, birthDate <- employeeValues.birthDate, startDate <- employeeValues.startDate, typeOfContract <- employeeValues.typeOfContract, yearsOfContract <- employeeValues.yearsOfContract, department <- employeeValues.department, vaccationDays <- employeeValues.vaccationDays, freeDays <- employeeValues.freeDays, paidLeave <- employeeValues.paidLeave, employeeImage <- employeeValues.employeeImage))
            return true
        }
         catch let error {
            print("Insertion failed: \(error)")
            return false
        }
    }
    
    static func updateRow(_ employeeValues: Employee) -> Bool? {
        guard let database = SQLiteDatabase.sharedInstance.database else {
            print("Datastore connection error")
            return nil
        }
        
        // Extracts the appropriate contact from the table according to the id
        let employee = table.filter(id == employeeValues.id).limit(1)
        
        do {
            // Update the contact's values
            if try database.run(employee.update(firstName <- employeeValues.firstName, lastName <- employeeValues.lastName, age <- employeeValues.age, gender <- employeeValues.gender, birthDate <- employeeValues.birthDate, startDate <- employeeValues.startDate, typeOfContract <- employeeValues.typeOfContract, yearsOfContract <- employeeValues.yearsOfContract, department <- employeeValues.department, vaccationDays <- employeeValues.vaccationDays, freeDays <- employeeValues.freeDays, paidLeave <- employeeValues.paidLeave, employeeImage <- employeeValues.employeeImage )) > 0 {
                print("Updated contact")
                return true
            } else {
                print("Could not update contact: contact not found")
                return false
            }
        } catch let error {
            print("Updation failed: \(error)")
            return false
        }
    }
    
    
    static func presentRows() -> [Employee]? {
        guard let database = SQLiteDatabase.sharedInstance.database else {
            print("Datastore connection error")
            return nil
        }
        
        // Contact Array
        var employeeArray = [Employee]()
        
        // Sorting data in descending order by ID
        table = table.order(id.desc)
        
        do {
            for employee in try database.prepare(table) {
                
                let idValue = employee[id]
                let firstNameValue = employee[firstName]
                let lastNameValue = employee[lastName]
                let ageValue = employee[age]
                let genderNameValue = employee[gender]
                let birthDateValue = employee[birthDate]
                let startDateValue = employee[startDate]
                let typeOfContractValue = employee[typeOfContract]
                let yearsOfContractValue = employee[yearsOfContract]
                let departmentValue = employee[department]
                let vaccationDaysValue = employee[vaccationDays]
                let freeDaysValue = employee[freeDays]
                let paidLeaveValue = employee[paidLeave]
                let imageValue = employee[employeeImage]
                
                
                // Create object
                let employeeObject = Employee(id: idValue, firstName: firstNameValue, lastName: lastNameValue, age: ageValue, gender: genderNameValue, birthDate: birthDateValue, startDate: startDateValue, typeOfContract: typeOfContractValue, yearsOfContract: yearsOfContractValue, department: departmentValue, vaccationDays: vaccationDaysValue, freeDays: freeDaysValue, paidLeave: paidLeaveValue, employeeImage: imageValue)
                
                // Add object to an array
                employeeArray.append(employeeObject)
                
                print("id \(employee[employeeImage]), firstName: \(employee[firstName]), lastName: \(employee[lastName])")
            }
        } catch {
            print("Present row error: \(error)")
        }
        return employeeArray
    }
    
    static func deleteRow(employeeID: Int) {
        guard let database = SQLiteDatabase.sharedInstance.database else {
            print("Datastore connection error")
            return
        }
        
        do {
            let employee = table.filter(id == employeeID).limit(1)
            try database.run(employee.delete())
        } catch {
            print("Delete row error: \(error)")
        }
    }
    
    
    static func findEmployees(withLastNameContaining query: String) -> [Employee]? {
           guard let database = SQLiteDatabase.sharedInstance.database else {
               print("Datastore connection error")
               return nil
           }
           
           var employeeArray = [Employee]()
           
           do {
               let filteredEmployees = table.filter(lastName.like("%\(query)%"))
               for employee in try database.prepare(filteredEmployees) {
                   let idValue = employee[id]
                   let firstNameValue = employee[firstName]
                   let lastNameValue = employee[lastName]
                   let ageValue = employee[age]
                   let genderNameValue = employee[gender]
                   let birthDateValue = employee[birthDate]
                   let startDateValue = employee[startDate]
                   let typeOfContractValue = employee[typeOfContract]
                   let yearsOfContractValue = employee[yearsOfContract]
                   let departmentValue = employee[department]
                   let vaccationDaysValue = employee[vaccationDays]
                   let freeDaysValue = employee[freeDays]
                   let paidLeaveValue = employee[paidLeave]
                   let imageValue = employee[employeeImage]
                   
                   let employeeObject = Employee(
                       id: idValue,
                       firstName: firstNameValue,
                       lastName: lastNameValue,
                       age: ageValue,
                       gender: genderNameValue,
                       birthDate: birthDateValue,
                       startDate: startDateValue,
                       typeOfContract: typeOfContractValue,
                       yearsOfContract: yearsOfContractValue,
                       department: departmentValue,
                       vaccationDays: vaccationDaysValue,
                       freeDays: freeDaysValue,
                       paidLeave: paidLeaveValue,
                       employeeImage: imageValue
                   )
                   
                   employeeArray.append(employeeObject)
               }
           } catch {
               print("Query error: \(error)")
           }
           
           return employeeArray
       }
}

//
//  EditEmployeeView.swift
//  EmployeeManager
//
//  Created by Miran on 08.06.2024..
//

import SwiftUI


struct EditEmployeeView: View {
    @StateObject var viewModel: EditEmployeeViewModel
    
    
    var body: some View {
        VStack {
            Form {
                Section("Info") {
                    TextField("Last name: ", text: $viewModel.lastName)
                    
                    Stepper("Age:  \(viewModel.age)", value: $viewModel.age, in: 18...99)
                    
                }
                
                Section("Contract") {
                    Picker("Type of contract", selection: $viewModel.typeOfContract) {
                        ForEach(viewModel.conracts, id: \.self) { contract in
                            Text(contract)
                        }
                    }
                    
                    DatePicker(selection: $viewModel.startDate, in: Date.now..., displayedComponents: .date) {
                                   Text("Start date: ")
                        }
                    
                    Picker("Years of contract", selection: $viewModel.yearsOfContract) {
                        ForEach(1...10, id: \.self) { year in
                            Text(String(year))
                            
                        }
                    }
                    
                    TextField("Department: ", text: $viewModel.department)
                    
                }
                
                
                Section("Additional") {
                    Stepper("Vaccation days :  \(viewModel.vaccationDays)", value: $viewModel.vaccationDays, in: 20...99)
                    Stepper("Free days:  \(viewModel.freeDays)", value: $viewModel.freeDays, in: 1...10)
                    Stepper("Paid leave :  \(viewModel.paidLeave)", value: $viewModel.paidLeave, in: 1...10)
                    
                }
            }
            .toolbar {
                Button("Update") {
                    viewModel.updateEmployee()
                }
                .alert(isPresented: $viewModel.showingAlert) {
                    Alert(title: Text("Invalid input"), message: Text(viewModel.errorMessage))
                }
            }
        }
    }
}


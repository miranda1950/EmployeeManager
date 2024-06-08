//
//  AddEmployeeView.swift
//  EmployeeManager
//
//  Created by Miran on 08.06.2024..
//

import SwiftUI
import PhotosUI

struct AddEmployeeView: View {
    @StateObject var viewModel: AddEmployeeViewModel
    
    
    var body: some View {
        VStack {
            Image(uiImage: viewModel.uiImage ?? UIImage(systemName: "person")!)
                .resizable()
                .scaledToFill()
                .frame(width: 200, height: 200)
                .clipped()
                .cornerRadius(40)
            photoPickerButton
            Form {
                Section("Info") {
                    TextField("First name: ", text: $viewModel.firstName)
                    TextField("Last name: ", text: $viewModel.lastName)
                    Picker("Gender", selection: $viewModel.selectedGender) {
                        ForEach(viewModel.genders, id: \.self) { gender in
                            Text(gender)
                            
                        }
                    }
                    
                    TextField("OIB:  ", value: $viewModel.oib, formatter: NumberFormatter())
                        .keyboardType(.numberPad)
                    
                    DatePicker(selection: $viewModel.birthDate, in: ...Date.now, displayedComponents: .date) {
                        Text("Birth date: ")
                    }
                    
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
                Button("Save") {
                    viewModel.saveEmployeeToDatabase()
                }
                .alert(isPresented: $viewModel.showingAlert) {
                    Alert(title: Text("Invalid input"), message: Text(viewModel.errorMessage))
                }
                
            }
            .padding(.bottom)
        }
        .onChange(of: viewModel.imageSelection) {
            Task { @MainActor in
                if let data = try? await viewModel.imageSelection?.loadTransferable(type: Data.self) {
                    viewModel.uiImage = UIImage(data:data)
                    return
                    
                }
            }
        }
    }
    
    var photoPickerButton: some View {
        PhotosPicker(
            selection: $viewModel.imageSelection,
            matching: .images,
            photoLibrary: .shared()) {
                Image(systemName: "camera.circle.fill")
                    .font(.system(size: 50))
                    .foregroundColor(.gray)
            }
    }
}

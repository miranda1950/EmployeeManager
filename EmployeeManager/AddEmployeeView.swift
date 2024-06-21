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
                    
                    DatePicker(selection: $viewModel.startDate, in: Date.now..., displayedComponents: .date) {
                        Text("Date: ")
                    }
                    
                    TextField("Hours: ", text: $viewModel.hours)
                        .keyboardType(.numberPad)
                    TextField("Minutes: ", text: $viewModel.minutes)
                        .keyboardType(.numberPad)
                }
            }
            
            .toolbar {
                Button("Save") {
                    viewModel.checkValidity()
                }
                .alert(isPresented: $viewModel.showingAlert) {
                    Alert(title: Text(viewModel.errorTitle), message: Text(viewModel.errorMessage))
                }
                
            }
            .padding(.bottom)
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

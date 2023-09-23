//
//  AddView.swift
//  TodoList_App
//
//  Created by ILYA POPOV on 22.09.2023.
//

import SwiftUI

struct AddView: View {
    
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var listViewModel: ListViewModel
    @State var textFieldText: String = ""
    
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("Type something here...", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: 50)
                    .background(Color(#colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)))
                .cornerRadius(10)
                
                Button {
                    saveButtonPressed()
                } label: {
                    Text("Save")
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 50)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                }

            }
            .padding(16)
        }
        .navigationTitle("Add an Item 🖊️")
        .alert(isPresented: $showAlert) {
            getAlert()
        }
    }
    
    //фунция сохранения введенных данных в Лист
    func saveButtonPressed() {
        if textIsAppropriate() {
            listViewModel.addItem(title: textFieldText)
            dismiss.callAsFunction()
        }
    }
    
    //функция для ограничения символов
    func textIsAppropriate() -> Bool {
        if textFieldText.count < 3 {
            alertTitle = "You new todo must be at 3 characters long!"
            showAlert.toggle()
            return false
        }
        
        return true
    }
    
    //функиция для Алерта
    func getAlert() -> Alert {
        return Alert(title: Text(alertTitle))
    }
    
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            AddView()
        }
        .environmentObject(ListViewModel())
    }
}


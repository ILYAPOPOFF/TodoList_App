//
//  ListView.swift
//  TodoList_App
//
//  Created by ILYA POPOV on 22.09.2023.
//

import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var listViewModel: ListViewModel
    
    var body: some View {
        List {
            ForEach(listViewModel.items) { item in
                ListRowView(item: item)
                //анимация при нажатии на ячейку
                    .onTapGesture {
                        withAnimation(.linear) {
                            listViewModel.updageItem(item: item)
                        }
                    }
            }
            //delete row
            .onDelete(perform: listViewModel.deleteItem)
            //перенос ячейки
            .onMove(perform: listViewModel.moveItem)
        }
        .listStyle(.inset)
        .navigationTitle("Todo List 📋")
        
        //Toolbar
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                EditButton()
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                NavigationLink("Add") {
                    AddView()
                }
            }
        }
    }
    
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ListView()
        }
        //Для вывода без ошибки на предварительном просмотре
        .environmentObject(ListViewModel())
    }
}


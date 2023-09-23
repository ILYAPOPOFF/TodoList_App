//
//  ListViewModel.swift
//  TodoList_App
//
//  Created by ILYA POPOV on 23.09.2023.
//

import Foundation

/*
 CRUD FUNCTIONS
 
 Create - Создание
 Read - Чтение
 Update - Обновление
 Delete - Удаление
 
 */

class ListViewModel: ObservableObject {
    
    @Published var items: [ItemModel] = [] {
        didSet {
            saveItem()
        }
    }
    
    
    let itemsKey = "items_list"
    
    init() {
        getItems()
    }
    
    func getItems() {
//        let newItems = [
//            ItemModel(title: "This is the first title!", isCompleted: false),
//            ItemModel(title: "This is the second!", isCompleted: true),
//            ItemModel(title: "Third!", isCompleted: false),
//        ]
//        items.append(contentsOf: newItems)
        
        guard
            //Проверям, есть ли у нас данные
            let data = UserDefaults.standard.data(forKey: itemsKey),
            //Проверяем, можем ли преобразовать данные в элементы
            let savedItems = try? JSONDecoder().decode([ItemModel].self, from: data)
        else { return }
        
        self.items = savedItems
    }
    
    //функция удаления ячейки
    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    
    //функция для переноса ячеек
    func moveItem(from: IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }
    
    //функция добавления элемента
    func addItem(title: String) {
        let newItem = ItemModel(title: title, isCompleted: false)
        items.append(newItem)
    }
    
    //функция для определения действия на ячейке
    func updageItem(item: ItemModel) {
        
//        if let index = items.firstIndex { existingItem in
//            return existingItem.id == item.id
//        } {
//            //Выполним этот код
//        }
        if let index = items.firstIndex(where: { $0.id == item.id }) {
            items[index] = item.updateCompletion()
        }
        
    }
    
    func saveItem() {
        if let encoderData = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encoderData, forKey: itemsKey)
        }
    }
    
}

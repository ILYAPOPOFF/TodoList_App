//
//  ItemModel.swift
//  TodoList_App
//
//  Created by ILYA POPOV on 23.09.2023.
//

import Foundation

// структура под стандарт индентифицирования
//неизменяемая структура
struct ItemModel: Identifiable, Codable {
    let id: String
    let title: String
    let isCompleted: Bool
    
    init(id: String = UUID().uuidString, title: String, isCompleted: Bool) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
    }
    
    func updateCompletion() -> ItemModel {
        return ItemModel(id: id, title: title, isCompleted: !isCompleted)
    }
}

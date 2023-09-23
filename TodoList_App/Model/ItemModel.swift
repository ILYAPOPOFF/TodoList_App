//
//  ItemModel.swift
//  TodoList_App
//
//  Created by ILYA POPOV on 23.09.2023.
//

import Foundation

// структура под стандарт индентифицирования
struct ItemModel: Identifiable {
    let id: String = UUID().uuidString
    let title: String
    let isCompleted: Bool
}

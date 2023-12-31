//
//  TodoList_AppApp.swift
//  TodoList_App
//
//  Created by ILYA POPOV on 22.09.2023.
//

import SwiftUI

@main
struct TodoList_AppApp: App {
    
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                ListView()
            }
        }
        .environmentObject(listViewModel)
    }
}

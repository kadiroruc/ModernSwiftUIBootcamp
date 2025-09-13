//
//  TaskViewModel.swift
//  Odev5
//
//  Created by Abdulkadir Oruç on 13.09.2025.
//

import SwiftUI

class TaskViewModel: ObservableObject {
    @Published var tasks: [Task] = []
    @Published var newTaskTitle: String = ""
    
    func addTask() {
        if !newTaskTitle.isEmpty {
            tasks.append(Task(title: newTaskTitle))
            newTaskTitle = ""
        }
    }
    
    func deleteTask(at indexSet: IndexSet) {
        tasks.remove(atOffsets: indexSet)
    }
    
    func toggleTaskCompletion(_ task: Task) {
        if let index = tasks.firstIndex(where: { $0.id == task.id }) {
            tasks[index].isCompleted.toggle()
        }
    }
}

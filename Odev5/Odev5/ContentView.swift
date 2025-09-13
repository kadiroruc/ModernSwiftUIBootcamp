//
//  ContentView.swift
//  Odev5
//
//  Created by Abdulkadir Oruç on 13.09.2025.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = TaskViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    TextField("Görev ekle", text: $viewModel.newTaskTitle)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    Button("Ekle") {
                        viewModel.addTask()
                    }
                }
                .padding()
                
                List {
                    ForEach(viewModel.tasks) { task in
                        HStack {
                            Button(action: {
                                viewModel.toggleTaskCompletion(task)
                            }) {
                                Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
                                    .foregroundColor(task.isCompleted ? .green : .gray)
                            }
                            
                            Text(task.title)
                                .strikethrough(task.isCompleted)
                        }
                    }
                    .onDelete(perform: viewModel.deleteTask)
                }
            }
            .navigationTitle("Görevler")
        }
    }
}

#Preview {
    ContentView()
}


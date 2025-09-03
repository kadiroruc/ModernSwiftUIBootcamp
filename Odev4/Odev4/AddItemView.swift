//
//  AddItemView.swift
//  Odev4
//
//  Created by Abdulkadir Oruç on 3.09.2025.
//
import SwiftUI

struct AddItemView: View {
    @Environment(\.dismiss) var dismiss
    @State private var title = ""
    @State private var description = ""
    @State private var isImportant = false
    
    var onAdd: (String, String, Bool) -> Void
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Title") {
                    TextField("Enter a title:", text: $title)
                }
                Section("Description") {
                    TextField("Enter a description:", text: $description)
                }
                Section("Is Important?") {
                    Toggle("Important", isOn: $isImportant)
                }
            }
            .navigationTitle("New Item")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") { dismiss() }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Add") {
                        onAdd(title, description, isImportant)
                        dismiss()
                    }
                    .disabled(title.isEmpty || description.isEmpty)
                }
            }
        }
    }
}

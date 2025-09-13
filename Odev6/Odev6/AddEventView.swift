//
//  AddEventView.swift
//  Odev6
//
//  Created by Abdulkadir Oruç on 13.09.2025.
//

import SwiftUI

struct AddEventView: View {
    @ObservedObject var viewModel: EventViewModel
    @Environment(\.dismiss) private var dismiss
    
    @State private var title = ""
    @State private var selectedDate = Date()
    @State private var selectedType = EventType.birthday
    @State private var hasReminder = false
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Etkinlik Adı", text: $title)
                DatePicker("Tarih", selection: $selectedDate)
                Picker("Tür", selection: $selectedType) {
                    ForEach(EventType.allCases, id: \.self) { type in
                        Text(type.rawValue).tag(type)
                    }
                }
                Toggle("Hatırlatıcı", isOn: $hasReminder)
            }
            .navigationTitle("Yeni Etkinlik")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("İptal") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Kaydet") {
                        let newEvent = Event(
                            title: title,
                            date: selectedDate,
                            type: selectedType,
                            hasReminder: hasReminder
                        )
                        viewModel.addEvent(newEvent)
                        dismiss()
                    }
                    .disabled(title.isEmpty)
                }
            }
        }
    }
}

#Preview {
    AddEventView(viewModel: EventViewModel())
}

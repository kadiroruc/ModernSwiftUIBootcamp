//
//  EventDetailView.swift
//  Odev6
//
//  Created by Abdulkadir Oruç on 13.09.2025.
//

import SwiftUI

struct EventDetailView: View {
    let event: Event
    @ObservedObject var viewModel: EventViewModel
    @Environment(\.dismiss) private var dismiss
    @State private var showingDeleteAlert = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text(event.title)
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Text("Tarih: \(event.date, style: .date)")
            Text("Saat: \(event.date, style: .time)")
            Text("Tür: \(event.type.rawValue)")
            Text("Hatırlatıcı: \(event.hasReminder ? "Açık" : "Kapalı")")
            
            Spacer()
            
            Button("Etkinliği Sil") {
                showingDeleteAlert = true
            }
            .foregroundColor(.red)
        }
        .padding()
        .navigationTitle("Detay")
        .alert("Etkinliği Sil", isPresented: $showingDeleteAlert) {
            Button("İptal", role: .cancel) { }
            Button("Sil", role: .destructive) {
                viewModel.deleteEvent(event)
                dismiss()
            }
        } message: {
            Text("Bu etkinliği silmek istediğinizden emin misiniz?")
        }
    }
}

#Preview {
    NavigationView {
        EventDetailView(
            event: Event(
                title: "Test Etkinliği",
                date: Date(),
                type: .birthday,
                hasReminder: true
            ),
            viewModel: EventViewModel()
        )
    }
}

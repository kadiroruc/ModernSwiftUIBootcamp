//
//  NoteDetailView.swift
//  Odev7
//
//  Created by Abdulkadir Oruç on 13.09.2025.
//

import SwiftUI

struct NoteDetailView: View {
    let note: Note
    @ObservedObject var viewModel: NotesViewModel
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 20) {
                Text(note.title)
                    .font(.title)
                    .fontWeight(.bold)
                
                Text(note.content)
                    .font(.body)
                
                Text(note.date, style: .date)
                    .font(.caption)
                    .foregroundColor(.secondary)
                
                Spacer()
            }
            .padding()
            .navigationTitle("Not Detayı")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Sil") {
                        viewModel.deleteNote(withId: note.id)
                        dismiss()
                    }
                    .foregroundColor(.red)
                }
            }
        }
    }
}

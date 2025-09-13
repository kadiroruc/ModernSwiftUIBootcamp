//
//  ContentView.swift
//  Odev7
//
//  Created by Abdulkadir Oruç on 13.09.2025.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = NotesViewModel()
    @State private var showingAddNote = false
    @State private var selectedNote: Note?
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.notes) { note in
                    Button(note.title) {
                        selectedNote = note
                    }
                    .foregroundColor(.primary)
                }
                .onDelete(perform: viewModel.deleteNote)
            }
            .navigationTitle("Notlarım")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        showingAddNote = true
                    }) {
                        Image(systemName: "plus.circle.fill")
                            .font(.title2)
                            .foregroundColor(.blue)
                    }
                }
            }
            .sheet(isPresented: $showingAddNote) {
                AddNoteView(viewModel: viewModel)
            }
            .sheet(item: $selectedNote) { note in
                NoteDetailView(note: note, viewModel: viewModel)
            }
        }
    }
}

#Preview {
    ContentView()
}

//
//  ContentView.swift
//  Odev4
//
//  Created by Abdulkadir Oruç on 3.09.2025.
//

import SwiftUI

struct DetailItem: Identifiable, Hashable {
    let id = UUID()
    var title: String
    var description: String
    var isImportant: Bool
}


struct ContentView: View {
    @State private var items: [DetailItem] = [
        DetailItem(title: "A", description: "AA", isImportant: true),
        DetailItem(title: "B", description: "BB", isImportant: true),
        DetailItem(title: "C", description: "CC", isImportant: false),
        DetailItem(title: "D", description: "DD", isImportant: false)
    ]
    
    @State private var path = NavigationPath()
    @State private var themeColor: Color = .blue
    @State private var showingAddItem = false
    
    var body: some View {
        NavigationStack(path: $path) {
            List {
                Section("Important") {
                    ForEach(items.filter { $0.isImportant }) { item in
                        NavigationLink(value: item) {
                            VStack(alignment: .leading) {
                                Text(item.title).font(.headline)
                                Text(item.description).font(.subheadline).foregroundColor(.secondary)
                            }
                        }
                        .swipeActions {
                            Button(role: .destructive) {
                                deleteItem(item)
                            } label: {
                                Label("Delete", systemImage: "trash")
                            }
                        }
                        .contentShape(Rectangle())
                    }
                }
                
                Section("Other") {
                    ForEach(items.filter { !$0.isImportant }) { item in
                        NavigationLink(value: item) {
                            VStack(alignment: .leading) {
                                Text(item.title).font(.headline)
                                Text(item.description).font(.subheadline).foregroundColor(.secondary)
                            }
                        }
                        .swipeActions {
                            Button(role: .destructive) {
                                deleteItem(item)
                            } label: {
                                Label("Delete", systemImage: "trash")
                            }
                        }
                        .contentShape(Rectangle())
                    }
                }
            }
            .navigationTitle("MasterListApp")
            .navigationDestination(for: DetailItem.self) { item in
                DetailView(item: item)
            }
            .onAppear {
                let colors: [Color] = [.blue, .green, .orange, .pink, .purple, .red, .teal]
                themeColor = colors.randomElement() ?? .blue
            }
            .tint(themeColor)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showingAddItem = true
                    } label: {
                        Image(systemName: "plus")
                            .tint(themeColor)
                    }
                }
            }
            .sheet(isPresented: $showingAddItem) {
                AddItemView { title, description, isImportant in
                    let newItem = DetailItem(title: title, description: description, isImportant: isImportant)
                    items.append(newItem)
                }
            }
        }
    }
    
    private func deleteItem(_ item: DetailItem) {
        items.removeAll { $0.id == item.id }
    }
}

#Preview {
    ContentView()
}

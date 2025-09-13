//
//  Note.swift
//  Odev7
//
//  Created by Abdulkadir Oruç on 13.09.2025.
//

import Foundation

struct Note: Codable, Identifiable {
    let id: UUID
    let title: String
    let content: String
    let date: Date
    
    init(title: String, content: String) {
        self.id = UUID()
        self.title = title
        self.content = content
        self.date = Date()
    }
}

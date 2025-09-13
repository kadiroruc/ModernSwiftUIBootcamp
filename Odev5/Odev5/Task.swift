//
//  Task.swift
//  Odev5
//
//  Created by Abdulkadir Oruç on 13.09.2025.
//

import Foundation

struct Task: Identifiable, Codable {
    var id = UUID()
    var title: String
    var isCompleted: Bool
    
    init(title: String, isCompleted: Bool = false) {
        self.title = title
        self.isCompleted = isCompleted
    }
}

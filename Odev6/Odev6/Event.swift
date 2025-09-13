//
//  Event.swift
//  Odev6
//
//  Created by Abdulkadir Oruç on 13.09.2025.
//

import Foundation

struct Event: Identifiable {
    let id = UUID()
    var title: String
    var date: Date
    var type: EventType
    var hasReminder: Bool
}

enum EventType: String, CaseIterable {
    case birthday = "Doğum Günü"
    case meeting = "Toplantı"
    case holiday = "Tatil"
    case sport = "Spor"
    case other = "Diğer"
}

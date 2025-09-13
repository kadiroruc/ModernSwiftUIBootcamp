//
//  EventViewModel.swift
//  Odev6
//
//  Created by Abdulkadir Oruç on 13.09.2025.
//

import Foundation

class EventViewModel: ObservableObject {
    @Published var events: [Event] = []
    
    func addEvent(_ event: Event) {
        events.append(event)
    }
    
    func deleteEvent(at indexSet: IndexSet) {
        events.remove(atOffsets: indexSet)
    }
    
    func deleteEvent(_ event: Event) {
        events.removeAll { $0.id == event.id }
    }
}

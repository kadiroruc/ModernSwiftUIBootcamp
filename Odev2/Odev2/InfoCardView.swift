//
//  InfoCard.swift
//  Odev2
//
//  Created by Abdulkadir Oruç on 22.08.2025.
//
import SwiftUI

struct InfoCard: View {
    var title: String
    var value: String
    
    var body: some View {
        VStack {
            Text(title)
                .font(.subheadline)
                .foregroundColor(.gray)
            Text(value)
                .font(.headline)
                .fontWeight(.bold)
        }
        .frame(maxWidth: .infinity, maxHeight: 30)
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}

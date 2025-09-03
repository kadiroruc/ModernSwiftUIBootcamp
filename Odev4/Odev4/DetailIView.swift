//
//  DetailItem 2.swift
//  Odev4
//
//  Created by Abdulkadir Oruç on 3.09.2025.
//
import SwiftUI

struct DetailView: View {
    var item: DetailItem
    private let symbols = ["pencil.fill", "star.fill", "plus", "book.fill"]
    
    var body: some View {
        VStack(spacing: 20) {
            Text(item.title)
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Text(item.description)
                .font(.title2)
                .foregroundStyle(.secondary)
            
            Image(systemName: symbols.randomElement()!)
                .resizable()
                .scaledToFit()
                .frame(width: 70, height: 70)
                .foregroundStyle(.blue)
        }
        .padding()
        .navigationTitle("Detail")
    }
}

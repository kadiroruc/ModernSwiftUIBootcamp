//
//  ContentView.swift
//  Odev3
//
//  Created by Abdulkadir Oruç on 30.08.2025.
//

import SwiftUI

struct ContentView: View {
    
    @State private var counter: Int = 0
    
    var body: some View {
        VStack(spacing: 50) {
            Text("Sayaç: \(counter)")
                .font(.largeTitle)
                .bold()
            
            HStack(spacing: 20) {
                Button(action: {
                    if counter > 0 {
                        counter -= 1
                    }else{
                        counter = 0
                    }
                }) {
                    Text("- Azalt")
                        .font(.title2)
                        .padding()
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(15)
                }
                
                Button(action: {
                    counter += 1
                }) {
                    Text("+ Artır")
                        .font(.title2)
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(15)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}

//
//  ContentView.swift
//  Odev2
//
//  Created by Abdulkadir Oruç on 22.08.2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            //Header
            ZStack {
                LinearGradient(gradient: Gradient(colors: [.white, .black]),
                               startPoint: .topLeading,
                               endPoint: .bottomTrailing)
                .frame(height: 300)
                .cornerRadius(30)
                
                VStack {
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150, height: 150)
                        .clipShape(Circle())
                        .shadow(radius: 10)
                    
                    Text("Abdulkadir Oruç")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                    Text("iOS Developer")
                        .font(.subheadline)
                        .foregroundColor(.white)
                }
            }
            
            //Kartlar
            HStack {
                InfoCard(title: "Followers", value: "7M")
                InfoCard(title: "Following", value: "58")
                InfoCard(title: "Likes", value: "5.8M")
            }
            .padding(.horizontal)
            .padding(.top, 10)
            
            //Hakkımda
            VStack(alignment: .leading, spacing: 10) {
                Text("About Me")
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(.top, 20)
                
                ScrollView {
                    Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus lacinia ex eu vestibulum. Integer at lacinia libero. Sed vel ante eget libero euismod vehicula. Nulla facilisi. Ut non ligula ac lorem pellentesque condimentum. Phasellus efficitur urna id nisi tincidunt, sed volutpat ligula scelerisque.")
                        .padding(.horizontal)
                        .multilineTextAlignment(.center)
                }
            }
            .padding(.horizontal)
            
            // Butonlar
            HStack(spacing: 20) {
                Button(action: {
                    
                }) {
                    Text("Send Message")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.black)
                        .cornerRadius(10)
                }
                
                Button(action: {
                    
                }) {
                    Text("Follow")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                }
            }
            .padding(.top, 20)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

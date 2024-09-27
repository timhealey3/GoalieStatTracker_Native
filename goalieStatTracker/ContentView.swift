//
//  ContentView.swift
//  goalieStatTracker
//
//  Created by Tim Healey on 9/26/24.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        NavigationStack {
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text("Welcome to Goalie Stat Tracker")
                HStack {
                    NavigationLink(destination: scoreKeeperView()) {
                        Text("New Game")
                    }.frame(maxHeight: .infinity, alignment: .bottom)
                    NavigationLink(destination: scoreKeeperView()) {
                        Text("Statistics")
                    }.frame(maxHeight: .infinity, alignment: .bottom)
                    NavigationLink(destination: scoreKeeperView()) {
                        Text("Profile")
                    }.frame(maxHeight: .infinity, alignment: .bottom)
                }
            }
            .padding()
            .navigationTitle("Home")
        }
    }
}


#Preview {
    ContentView()
}

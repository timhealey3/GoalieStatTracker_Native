//
//  ContentView.swift
//  goalieStatTracker
//
//  Created by Tim Healey on 9/26/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    var body: some View {
        NavigationStack {
            VStack {
                // stat card
                StatCardView(stats: [0, 0,0]).background(Color(red: 0.0, green: 0.8, blue: 1.0).opacity(0.4))
                // previous games
                HistoryStatCard()
                    .modelContainer(for: Game.self)
                HStack {
                    NavigationLink(destination: gameCreatorView()) {
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

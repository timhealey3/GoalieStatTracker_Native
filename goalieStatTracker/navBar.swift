//
//  navBar.swift
//  goalieStatTracker
//
//  Created by Tim Healey on 10/6/24.
//

import Foundation
import SwiftUI

struct navBar: View {
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    // create game
                    NavigationLink(destination: gameCreatorView()) {
                        Text("New Game")
                    }.frame(maxHeight: .infinity, alignment: .bottom)
                    // stats
                    NavigationLink(destination: statsView()) {
                        Text("Statistics")
                    }.frame(maxHeight: .infinity, alignment: .bottom)
                    // profile
                    NavigationLink(destination: profileView()) {
                        Text("Profile")
                    }.frame(maxHeight: .infinity, alignment: .bottom)
                }
            }
            .padding()
        }
    }
}

//
//  gameCreator.swift
//  goalieStatTracker
//
//  Created by Tim Healey on 10/4/24.
//

import Foundation
import SwiftUI
import SwiftData

struct gameCreatorView: View {
    @Query private var games: [Game]
    @Environment(\.modelContext) private var context
    @StateObject var gameCreator = gameCreatorHelper()
    var body: some View {
        NavigationStack {
            VStack {
                // opponent name
                TextField(
                    "Opponent Name",
                    text: $gameCreator.opponent
                ).frame(width: 150)
                // minutes
                HStack {
                    Button(action: {gameCreator.minutes = (gameCreator.minutes > 0) ? gameCreator.minutes - 1 : 0}) {
                        Label("Period Minutes \(gameCreator.minutes)", systemImage: "minus.circle")
                    }
                    Button(action: {gameCreator.minutes += 1}) {
                        Label("", systemImage: "plus.circle")
                    }
                }
                // starting or not
                Picker(selection: $gameCreator.startingGoalie, label: Text("")) {
                    ForEach(depthChart.allCases) { depth in
                        Text(depth.rawValue.capitalized)
                    }
                }
                // adv or basic
                Picker(selection: $gameCreator.advancedBasicInd, label: Text("")) {
                    Text("Basic").tag(true)
                    Text("Advanced").tag(false)
                }.pickerStyle(SegmentedPickerStyle())
                // submit
                NavigationLink(destination: gameCreator.advancedBasicInd ? AnyView(scoreKeeperBasicView(opponent : gameCreator.opponent)) : AnyView(scoreKeeperView(opponent : gameCreator.opponent))) {
                    Text("Create")
                        .foregroundColor(.white)
                        .padding()
                }
                .background(Color.blue)
                .cornerRadius(10.0)
                navBar()
                .navigationTitle("Game Creator")
            }
        }
    }
}

struct gameCreatorPreview: PreviewProvider {
    static var previews: some View {
        gameCreatorView()
    }
}

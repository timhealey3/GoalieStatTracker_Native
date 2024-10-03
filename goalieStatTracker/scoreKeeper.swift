//
//  scoreKeeper.swift
//  goalieStatTracker
//
//  Created by Tim Healey on 9/26/24.
//

import Foundation
import SwiftUI
import SwiftData

struct scoreKeeperView: View {
    @Query private var games: [Game]
    @Environment(\.modelContext) private var context
    @StateObject var scoreKeeper = scoreKeeperHelper()
    @State private var newDate = Date.now
    
    var body: some View {
        
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Score Keeper")
            Button(action: {scoreKeeper.addGoal()}) {
                Label("\(scoreKeeper.currentGoals)", systemImage: "folder.badge.plus")
            }
            Button(action: {scoreKeeper.subGoal()}) {
                Label("\(scoreKeeper.currentGoals)", systemImage: "folder.badge.plus")
            }
            Button("Save") {
                let newGame = Game(id: games.count, opponentID: scoreKeeper.currentOpponentID, gameDate: newDate, goals: scoreKeeper.currentGoals, goalCord: scoreKeeper.currentGoalCords, goalType: scoreKeeper.currentShotType, shots: scoreKeeper.currentShots, shotCord: scoreKeeper.currentShotCords, shutOut: scoreKeeper.isShutOut(), gameState: scoreKeeper.getgameState(), overTime: scoreKeeper.currentOT, shootOut: scoreKeeper.currentShootout, notes: scoreKeeper.currentNotes)
                context.insert(newGame)
                
                newDate = .now
            }
        }
        .navigationTitle("Score Keeper")
    }
}

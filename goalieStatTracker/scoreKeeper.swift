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
            Text("Score Keeper")
            TextField(
                "Opponent Name",
                text: $scoreKeeper.opponent
            ).frame(width: 150)
            Text(scoreKeeper.opponent)
            // Shots
            HStack {
                Button(action: {
                    scoreKeeper.shots
                    = scoreKeeper.shots > 0 ? scoreKeeper.shots - 1 : 0}
                ) {
                    Label("Shots \(scoreKeeper.shots)", systemImage: "minus.circle")
                }
                Button(action: {scoreKeeper.shots += 1}) {
                    Label("", systemImage: "plus.circle")
                }
            }
            // Goals
            HStack {
                Button(action: {scoreKeeper.goals = scoreKeeper.goals > 0 ? scoreKeeper.goals - 1 : 0}) {
                    Label("Goals \(scoreKeeper.goals)", systemImage: "minus.circle")
                }
                Button(action: {scoreKeeper.goals += 1}) {
                    Label("", systemImage: "plus.circle")
                }
            }
            
            VStack {
                Picker("Game Outcome", selection: $scoreKeeper.gameOutcomeVar) {
                    ForEach(GameOutcome.allCases) { outcomes in
                        Text(outcomes.rawValue.capitalized)
                    }
                }
                Picker("Game Outcome OT", selection: $scoreKeeper.gameOutcomeOTVar) {
                    ForEach(GameOutcomeOT.allCases) { outcomesOT in
                        Text(outcomesOT.rawValue.capitalized)
                    }
                }
            }
            .pickerStyle(.segmented)

            
            Button("Save") {
                let newGame = Game(id: games.count + 1, opponentID: scoreKeeper.opponentID, gameDate: newDate, goals: scoreKeeper.goals, goalCord: scoreKeeper.GoalCords, goalType: scoreKeeper.shotType, shots: scoreKeeper.shots, shotCord: scoreKeeper.ShotCords, shutOut: scoreKeeper.isShutOut(), gameState: scoreKeeper.getgameState(), overTime: scoreKeeper.OtInd, shootOut: scoreKeeper.ShootoutInd, notes: scoreKeeper.Notes)
                context.insert(newGame)
                newDate = .now
            }
        }
        .navigationTitle("Score Keeper")
    }
}

struct scoreKeeperPreview: PreviewProvider {
    static var previews: some View {
        scoreKeeperView()
            .modelContainer(for: Game.self, inMemory: true)
    }
}

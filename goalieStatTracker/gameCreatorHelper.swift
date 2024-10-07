//
//  gameCreatorHelper.swift
//  goalieStatTracker
//
//  Created by Tim Healey on 10/4/24.
//

import Foundation
import SwiftData

enum depthChart: String, CaseIterable, Identifiable {
    case starting, backup, third, scratched, injured, other
    var id: Self { self }
}

class gameCreatorHelper : ObservableObject {
    // init var
    @Published var opponent: String = ""
    @Published var minutes: Int = 20
    @Published var startingGoalie: depthChart = .starting;
    @Published var advancedBasicInd: Bool = false;
    @Published var results: [Team] = []

    // func that finds opponents
    func fetchOpponentID(from context: ModelContext) -> [Team] {
        let fetchDescriptor = FetchDescriptor<Team>(
            predicate: #Predicate { $0.teamName == opponent }
        )
        do {
            let results = try context.fetch(fetchDescriptor)
            return results
        } catch {
            print("Failed to fetch team: \(error)")
            return []
        }
    }
    
    func createGame() -> Void {
        print("create game")
    }

    // func that filters opponents
//    func filterTeams() -> [Team] {
//        
//    }
}


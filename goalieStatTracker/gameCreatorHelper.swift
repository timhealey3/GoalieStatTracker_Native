//
//  gameCreatorHelper.swift
//  goalieStatTracker
//
//  Created by Tim Healey on 10/4/24.
//

import Foundation

class gameCreatorHelper : ObservableObject {
    // init var
    @Published var opponent: String = ""
    @Published var minutes: Int = 0
    @Published var startingGoalie: Bool = false;

    // func that finds opponents
    func findTeams() -> [Team] {
    
    }

    // func that filters opponents
    func filterTeams() -> [Team]
}


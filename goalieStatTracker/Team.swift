//
//  Team.swift
//  goalieStatTracker
//
//  Created by Tim Healey on 10/2/24.
//

import Foundation
import SwiftData

@Model
class Team {
    let id: Int
    let teamName: String
    
    init(id: Int, teamName: String) {
        self.id = id
        self.teamName = teamName
    }
}

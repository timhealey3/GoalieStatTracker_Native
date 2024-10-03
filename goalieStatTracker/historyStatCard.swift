//
//  historyStatCard.swift
//  goalieStatTracker
//
//  Created by Tim Healey on 9/28/24.
//

import Foundation
import SwiftUI
import SwiftData

struct HistoryStatCard: View {
    //let games: [[Int]]
    @Query private var games: [Game]
    @Environment(\.modelContext) private var context
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("History")
                .font(.headline)
            // game cards
            List(games, id: \.id) { game in
                 HStack {
                     Text(game.notes)
                     Spacer()
                     Text(game.gameDate, format: .dateTime.month(.wide).day().year())
                 }
             }
        }
    }
}


struct HistoryStatCardPreview: PreviewProvider {
    static var previews: some View {
        HistoryStatCard()
            .modelContainer(for: Game.self, inMemory: true)         .previewLayout(.fixed(width: 400, height: 60)) // Fix layout
    }
}

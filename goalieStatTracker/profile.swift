//
//  profile.swift
//  goalieStatTracker
//
//  Created by Tim Healey on 10/6/24.
//

import Foundation
import SwiftUI

struct profileView : View {
    var body: some View {
        VStack {
            navBar()
            .navigationTitle("Profile")
        }
    }
}

struct profilePreview: PreviewProvider {
    static var previews: some View {
        profileView()
    }
}

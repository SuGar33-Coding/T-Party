//
//  FavoriteButton.swift
//  T-Party
//
//  Created by Gabriel Klavans on 1/18/24.
//

import SwiftUI

struct FavoriteButton: View {
    @Environment(Preferences.self) var preferences
    @State var isSet: Bool
    var routeId: String
    
    var body: some View {
        Button {
            isSet.toggle()
        } label: {
            Label("Toggle Favorite", systemImage: isSet ? "star.fill" : "star")
                .labelStyle(.iconOnly)
                .foregroundStyle(isSet ? .yellow : .gray)
        }.onChange(of: isSet, initial: false) { _, newValue in
            if newValue {
                preferences.data.favorites.append(routeId)
            } else {
                preferences.data.favorites = preferences.data.favorites.filter { $0 != routeId }
            }
        }
    }
}

#Preview {
    FavoriteButton(isSet: true, routeId: "1")
        .environment(Preferences())
}

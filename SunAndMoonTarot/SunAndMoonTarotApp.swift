//
//  SunAndMoonTarotApp.swift
//  SunAndMoonTarot
//
//  Created by Nicholas Miravich on 7/10/24.
//

import SwiftUI
import SwiftData

@main
struct SunAndMoonTarotApp: App {
    @StateObject private var decks = DeckHolder()
    @StateObject private var dataManager = DataManager()
    @StateObject private var settings = SettingsManager()


    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(decks)
                .environmentObject(dataManager)
                .environmentObject(settings)
        }
    }
}

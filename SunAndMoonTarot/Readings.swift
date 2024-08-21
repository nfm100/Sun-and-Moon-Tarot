//
//  Readings.swift
//  Tarot?
//
//  Created by Nicholas Miravich on 6/28/24.
//

import SwiftUI
import SwiftData

struct Readings: View {
    @EnvironmentObject var decks: DeckHolder
    @EnvironmentObject var dataManager: DataManager


    
    init() {
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
        UINavigationBar.appearance().shadowImage = UIImage()
    }

    var body: some View {
        NavigationStack {
            List {
                Group{
                    NavigationLink(destination: YesNo().environmentObject(decks)) {
                        Text("Yes or No?")
                    }
                    NavigationLink(destination: ThreeCards().environmentObject(decks)) {
                        Text("Past, Present, Future")
                    }
                    NavigationLink(destination: Celtic().environmentObject(decks)) {
                        Text("Celtic Cross")
                    }
                }
                .environmentObject(decks)
                .environmentObject(dataManager)
                .foregroundColor(.black)
                .listRowBackground(
                    Capsule()
                        .fill(Color(white: 1, opacity: 0.4))
                        .padding(.vertical, 2).padding(.horizontal, 4))
                .listRowSeparator(.hidden)
            }
            .navigationTitle("Readings")
            .toolbarBackground(.ultraThinMaterial, for: .navigationBar)
            .toolbarBackground(.ultraThinMaterial, for: .bottomBar)
            .background(LinearGradient(colors: [.purple, .indigo, .blue, .clear], startPoint: .top, endPoint: .bottomTrailing)
                .ignoresSafeArea())
            .scrollContentBackground(.hidden)
            
        }
        
    }
}

struct Readings_Previews: PreviewProvider {
    static var previews: some View {
        Readings()
            .environmentObject(DeckHolder())
            .environmentObject(DataManager())
    }
}

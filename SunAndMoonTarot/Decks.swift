//
//  Decks.swift
//  Tarot?
//
//  Created by Nicholas Miravich on 6/28/24.
//

import SwiftUI

struct Decks: View {
    @EnvironmentObject var decks: DeckHolder
    
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(colors: [.purple, .indigo, .blue, .clear], startPoint: .top, endPoint: .bottomTrailing)
                    .ignoresSafeArea()
                ScrollView {
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 150))], spacing: 25) {
                        DeckView(deckName: "Rider Waite", deck: decks.decks["Rider Waite"] ?? [:])
                        DeckView(deckName: "Everyday Witch", deck: decks.decks["Everyday Witch"] ?? [:])
                        DeckView(deckName: "English Magic", deck: decks.decks["English Magic"] ?? [:])
                        DeckView(deckName: "Gothic", deck: decks.decks["Gothic"] ?? [:])
                        DeckView(deckName: "Herbal", deck: decks.decks["Herbal"] ?? [:])
                        DeckView(deckName: "Hermetic", deck: decks.decks["Hermetic"] ?? [:])
                        DeckView(deckName: "International Icon", deck: decks.decks["International Icon"] ?? [:])
                        // Add additional decks here in the order you want
                    }
                }
                .toolbarBackground(.ultraThinMaterial, for: .navigationBar)
                .scrollContentBackground(.hidden)
                .navigationTitle("Decks")
            }
        }
    }
}

struct DeckView: View {
    let deckName: String
    let deck: [String: String]
    @EnvironmentObject var decks: DeckHolder
    
    var body: some View {
        HStack {
            NavigationLink(destination: DetailedDeckView(deckName: deckName, deck: deck)
                .environmentObject(decks)) {
                VStack {
                    if let sunCardKey = deck.first(where: { $0.value == "The Sun" })?.key {
                        Image(sunCardKey)
                            .resizable()
                            .aspectRatio(CGSize(width: 0.9, height: 1.6), contentMode: .fit)
                            .cornerRadius(2)
                    }
                    Text(deckName)
                        .font(.body)
                        .foregroundColor(.black)
                        .frame(width: 120, alignment: .leading)
                        .multilineTextAlignment(.leading)
                    Spacer()
                    Button{
                        decks.selectedDeck = deckName
                    }label:{
                        Text("Select")
                            .frame(width: 100, height: .leastNormalMagnitude)
                            .font(.body)
                            .foregroundColor(.white)
                            .padding()
                            .background(decks.selectedDeck == deckName ? Color(white: 1, opacity: 0.4) : .black)
                            .clipShape(RoundedRectangle(cornerRadius: 18))
                            
                    }
                }
                .padding()
                .background(Color(white: 1, opacity: 0.4))
                .clipShape(RoundedRectangle(cornerRadius: 18))
                .frame(width: 150)
                .padding(.horizontal, 4)
                                
            }
            
           
        }
    }
}

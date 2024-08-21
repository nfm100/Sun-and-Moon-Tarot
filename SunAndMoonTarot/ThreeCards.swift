//
//  ThreeCards.swift
//  Tarot?
//
//  Created by Nicholas Miravich on 6/28/24.
//

import SwiftUI

struct ThreeCards: View {
    @EnvironmentObject var decks: DeckHolder
    @EnvironmentObject var dataManager: DataManager
    @State private var isButtonVisible = true
    @State private var results: [(String, String)] = []
    @State private var detailViewPresent: [Bool] = [false, false, false] // Separate state for each card

    var body: some View {
        ZStack {
            LinearGradient(colors: [.purple, .indigo, .blue, .clear], startPoint: .top, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            VStack {
                if isButtonVisible {
                    VStack {
                        ScrollView {
                            Text("""
                            In the realm of Tarot, each card drawn is a key to the mystical tapestry of your life’s journey. When engaging in a Past, Present, and Future reading, you are inviting the wisdom of the Universe to illuminate the pathways of your soul’s evolution.

                            The Past card serves as a sacred mirror, reflecting the energies and events that have shaped your current existence. It whispers the lessons learned, the joys celebrated, and the sorrows endured. This card honors your personal history, revealing how past experiences have woven the intricate patterns of your present moment. It beckons you to acknowledge and heal from what has been, recognizing the foundation upon which your current reality stands.

                            The Present card is the heartbeat of your reading, vibrating with the energies that currently envelop your being. It is the voice of now, urging you to be fully present in your life’s immediate tapestry. This card holds the power of the moment, offering guidance on how to navigate current challenges, embrace opportunities, and align with your highest purpose. It reminds you that the present is a precious gift, and the choices you make today are the seeds of your future.

                            The Future card is a beacon of potential, shining light on the path that lies ahead. It does not dictate a fixed destiny, but rather reveals the direction in which your current energies and actions are leading you. This card invites you to step into the unknown with faith and courage, offering a glimpse of the possibilities that await. It encourages you to dream, aspire, and manifest your deepest desires, knowing that the future is a canvas yet to be painted with the colors of your intention and will.

                            Together, these three cards form a triad of wisdom, a spiritual compass guiding you through the cycles of time. They connect you with the eternal dance of existence, reminding you that every moment is a thread in the grand tapestry of your soul’s journey. Through the insights of the Past, Present, and Future, you are empowered to embrace your divine path with clarity, grace, and profound spiritual awareness.
                            """)
                                .padding()
                        }
                        Spacer()
                        Button("Invoke the Spirits") {
                            isButtonVisible = false
                            results = selectCards()
                            addReading(cards: results.map { $0.1 })
                        }
                        .buttonBorderShape(.capsule)
                        .buttonStyle(.bordered)
                        .controlSize(.large)
                        .tint(.black)
                        .padding()
                        Spacer()
                    }
                } else {
                    HStack(spacing: 10) {
                        ForEach(0..<results.count, id: \.self) { index in
                            Button(action: {
                                detailViewPresent[index].toggle() // Toggle popover state for each card
                            }) {
                                VStack {
                                    Image(results[index].0)
                                        .resizable()
                                        .frame(width: 110, height: 190)
                                    
                                    Text(results[index].1)
                                        .foregroundColor(.black)
                                        .frame(width: 110)
                                        .multilineTextAlignment(.center)
                                        .lineLimit(nil)
                                        .fixedSize(horizontal: false, vertical: true)
                                }
                                .frame(maxHeight: 300, alignment: .top)
                            }
                            .popover(isPresented: $detailViewPresent[index]) {
                                DetailCardView(cardName: results[index].1, imageName: results[index].0)
                                    .environmentObject(decks)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Past, Present, Future")
            .padding()
            .environmentObject(decks)
        }
    }
    
    private func selectCards() -> [(String, String)] {
        let currentDeck = decks.getCurrentDeck()
        var locations: Set<Int> = []
        while locations.count < 3 {
            let location = Int.random(in: 0..<currentDeck.count)
            locations.insert(location)
        }
        
        let results = locations.map { index in
            let key = Array(currentDeck.keys)[index]
            let value = currentDeck[key]!
            return (key, value)
        }
        
        return Array(results)
    }

    private func addReading(cards: [String]) {
        let newReading = TarotReading(date: Date(), cards: cards, type: "ThreeCards")
        dataManager.addReading(reading: newReading)
    }
}

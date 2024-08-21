import SwiftUI

struct DetailedDeckView: View {
    let deckName: String
    let deck: [String: String]
    @EnvironmentObject var decks: DeckHolder
    @State private var detailViewPresent: [Bool] = []
    
    var sortedKeys: [String] {
        deck.keys.sorted(by: { getCardOrder(cardKey: $0) < getCardOrder(cardKey: $1) })
    }
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))], spacing: 30) {
                ForEach(Array(sortedKeys.enumerated()), id: \.offset) { index, key in
                    let cardName = deck[key]!
                    Button(action: {
                        if detailViewPresent.count <= index {
                            detailViewPresent.append(true)
                        } else {
                            detailViewPresent[index].toggle()
                        }
                    }) {
                        VStack {
                            Image(key)
                                .resizable()
                                .frame(width: 110, height: 190)
                            Text(cardName)
                                .foregroundColor(.black)
                                .frame(width: 110)
                                .multilineTextAlignment(.center)
                                .lineLimit(nil)
                                .fixedSize(horizontal: false, vertical: true)
                        }
                        .frame(maxHeight: .infinity, alignment: .top)
                    }
                    .popover(isPresented: Binding(
                        get: { detailViewPresent.count > index ? detailViewPresent[index] : false },
                        set: { detailViewPresent[index] = $0 }
                    )) {
                        DetailCardView(cardName: cardName, imageName: key)
                            .environmentObject(decks)
                    }
                    .onAppear {
                        if detailViewPresent.count <= index {
                            detailViewPresent.append(false)
                        }
                    }
                }
            }
            .padding()
        }
        .navigationTitle(deckName)
    }
    
    // Helper function to get the order of a card key based on the full list
    private func getCardOrder(cardKey: String) -> Int {
        if let cardName = deck[cardKey], let index = decks.CardNamesFullList.firstIndex(of: cardName) {
            return index
        }
        return decks.CardNamesFullList.count
    }
}

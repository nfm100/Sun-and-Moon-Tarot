import SwiftUI

struct ReadingDetailView: View {
    let reading: TarotReading
    @EnvironmentObject var decks: DeckHolder
    @State private var detailViewPresent: [Bool] = []

    private let typeDisplayNames: [String: String] = [
        "YesNo": "Yes or No?",
        "ThreeCards": "Past, Present, Future",
        // Add other type mappings here
    ]
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [.purple, .indigo, .blue, .clear], startPoint: .top, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            VStack {
                Text("Cards:")
                    .font(.headline)
                    .padding(.top)
                
                ScrollView {
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))], spacing: 30) {
                        ForEach(reading.cards.indices, id: \.self) { index in
                            let cardName = reading.cards[index]
                            if let imageName = decks.getCurrentDeck().first(where: { $0.value == cardName })?.key {
                                Button(action: {
                                    if detailViewPresent.count <= index {
                                        detailViewPresent.append(true)
                                    } else {
                                        detailViewPresent[index].toggle()
                                    }
                                }) {
                                    VStack {
                                        Image(imageName)
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
                                    DetailCardView(cardName: cardName, imageName: imageName)
                                        .environmentObject(decks)
                                }
                                .onAppear {
                                    if detailViewPresent.count <= index {
                                        detailViewPresent.append(false)
                                    }
                                }
                            }
                        }
                    }
                    .padding()
                }
                Spacer()
            }
            .padding()
            .navigationTitle("\(displayName(for: reading.type))")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    VStack {
                        Text("\(reading.date, formatter: DateFormatter.shortDate)")
                            .font(.subheadline)
                    }
                }
            }
        }
    }
    
    private func displayName(for type: String) -> String {
        return typeDisplayNames[type] ?? type
    }
}

extension DateFormatter {
    static var shortDate: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        return formatter
    }
}

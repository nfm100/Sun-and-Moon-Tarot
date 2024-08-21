import SwiftUI
import SwiftData

struct YesNo: View {
    @EnvironmentObject var decks: DeckHolder
    @EnvironmentObject var dataManager: DataManager
    @State private var isButtonVisible = true
    @State private var results: (String, String)? = nil
    @State private var detailViewPresent = false

    var body: some View {
        ZStack {
            LinearGradient(colors: [.purple, .indigo, .blue, .clear], startPoint: .top, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            VStack {
                if isButtonVisible {
                    VStack {
                        ScrollView {
                            Text("""
                            A Yes or No Tarot reading is a divine dialogue between your soul and the infinite wisdom of the Universe. It is a practice that transcends the simplicity of an answer, reaching into the depths of spiritual guidance to illuminate the path ahead.

                            The Yes card embodies the energy of affirmation and alignment. When this card reveals itself, it is a cosmic nod from the Universe, affirming that the energies are aligned with your question or intention. It signifies a harmonious flow with the greater cosmic order, suggesting that the path you are considering is in harmony with your soul’s purpose. This card encourages you to move forward with confidence and trust, knowing that the Universe supports your journey. It is an invitation to embrace the opportunities and challenges with an open heart, secure in the knowledge that you are on the right path.

                            The No card carries the wisdom of reflection and redirection. When this card appears, it is not a denial but a sacred pause, urging you to reconsider and reevaluate your current course. It may signify that the timing is not right, or that there are unseen factors that need your attention. This card invites you to delve deeper into your intuition and inner knowing, to understand the underlying reasons for the blockage. It is a call to trust that the Universe has your highest good in mind, and that a different path or approach may be more beneficial for your soul’s journey. The No card encourages patience, introspection, and a willingness to embrace new perspectives.

                            In the sacred space of a Yes or No Tarot reading, you engage in a profound spiritual exchange. The cards act as mirrors, reflecting the divine energies that surround your question. They invite you to trust in the greater wisdom of the Universe, to be open to the guidance that flows through each card. This reading is a reminder that every answer, whether Yes or No, is a step towards deeper understanding and spiritual growth. It teaches you that the journey is not just about the destination, but about the insights and wisdom gained along the way.

                            Through the Yes or No Tarot reading, you connect with the eternal dance of the cosmos, aligning your intentions with the divine flow of life. It is a sacred practice that offers clarity, direction, and a deeper connection to your spiritual path, guiding you with love and profound wisdom.
                            """)
                            .padding()
                        }
                        Spacer()
                        Button("Invoke the Spirits") {
                            isButtonVisible = false
                            results = selectCard()
                            if let results = results {
                                addReading(cardName: results.1)
                            } else {
                                print("Error: No results from selectCard()")
                            }
                        }
                        .buttonBorderShape(.capsule)
                        .buttonStyle(.bordered)
                        .controlSize(.large)
                        .tint(.black)
                        .padding()
                        Spacer()
                    }
                } else {
                    if let results = results {
                        VStack(spacing: 5) {
                            Button(action: {
                                detailViewPresent.toggle()
                            }) {
                                VStack {
                                    Image(results.0)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 275, height: 475)
                                    
                                    Text(results.1)
                                        .foregroundColor(.black)
                                        .frame(width: 275)
                                        .multilineTextAlignment(.center)
                                        .lineLimit(nil)
                                        .fixedSize(horizontal: false, vertical: true)
                                        .fontWeight(.bold)
                                        .font(.largeTitle)
                                    Text("Yes/No?")
                                        .foregroundColor(.black)
                                        .frame(width: 275)
                                        .multilineTextAlignment(.center)
                                        .lineLimit(nil)
                                        .fixedSize(horizontal: false, vertical: true)
                                        .fontWeight(.bold)
                                        .font(.title2)
                                }
                                .frame(alignment: .centerLastTextBaseline)
                            }
                            .popover(isPresented: $detailViewPresent) {
                                DetailCardView(cardName: results.1, imageName: results.0)
                                    .environmentObject(decks)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Yes or No?")
            .padding()
            .environmentObject(decks)
        }
    }
    
    private func selectCard() -> (String, String) {
            let currentDeck = decks.getCurrentDeck()
            let location = Int.random(in: 0..<currentDeck.count)
            let key = Array(currentDeck.keys)[location]
            let value = currentDeck[key]!
            return (key, value)
        }
    
    private func addReading(cardName: String) {
        let newReading = TarotReading(date: Date(), cards: [cardName], type: "YesNo")
        dataManager.addReading(reading: newReading)
    }
}

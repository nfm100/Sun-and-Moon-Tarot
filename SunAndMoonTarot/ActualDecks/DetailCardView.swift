//
//  DetailCardView.swift
//  Tarot?
//
//  Created by Nicholas Miravich on 7/1/24.
//

import SwiftUI

struct DetailCardView: View {
    @EnvironmentObject var decks: DeckHolder
    let cardName: String
    let imageName: String

    var body: some View {
        VStack (spacing: 5) {
            ScrollView {
                Image(imageName)
                    .resizable()
                    .frame(width: 330, height: 570)
                    .padding()

                Text(cardName)
                    .font(.title)
                    .multilineTextAlignment(.center)
                    .lineLimit(nil)
                    .padding()

                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed tempor leo quis justo ultricies, at dignissim sapien rhoncus. Nam eget venenatis nisi. Nulla facilisi. Proin eleifend velit ac interdum consequat.")
                    .padding()
            }
        }
        .padding()
    }
}

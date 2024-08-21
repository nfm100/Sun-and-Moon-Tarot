import Foundation
import SwiftUI

class SettingsManager: ObservableObject {
    @Published var backgroundColorChoice: ColorChoice {
        didSet {
            UserDefaults.standard.set(backgroundColorChoice.rawValue, forKey: "backgroundColorChoice")
        }
    }

    init() {
        if let savedChoice = UserDefaults.standard.string(forKey: "backgroundColorChoice"),
           let choice = ColorChoice(rawValue: savedChoice) {
            self.backgroundColorChoice = choice
        } else {
            self.backgroundColorChoice = .lightBackground1 // Default value
        }
    }
}

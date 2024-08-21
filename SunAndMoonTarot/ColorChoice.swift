//
//  ColorChoice.swift
//  SunAndMoonTarot
//
//  Created by Nicholas Miravich on 7/11/24.
//

import SwiftUI

enum ColorChoice: String, CaseIterable, Identifiable {
    case lightBackground1, lightBackground2, darkBackground1, darkBackground2

    var id: String { self.rawValue }
    
    func gradient(for scheme: ColorScheme) -> LinearGradient {
        switch self {
        case .lightBackground1:
            return LinearGradient(
                gradient: Gradient(colors: [Color.white, Color.gray]),
                startPoint: .top,
                endPoint: .bottom)
        case .lightBackground2:
            return LinearGradient(
                gradient: Gradient(colors: [Color.blue, Color.green]),
                startPoint: .top,
                endPoint: .bottom)
        case .darkBackground1:
            return LinearGradient(
                gradient: Gradient(colors: [Color.black, Color.gray]),
                startPoint: .top,
                endPoint: .bottom)
        case .darkBackground2:
            return LinearGradient(
                gradient: Gradient(colors: [Color.gray, Color.black]),
                startPoint: .top,
                endPoint: .bottom)
        }
    }
}

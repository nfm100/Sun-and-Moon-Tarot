//
//  CommonCardModel.swift
//  Tarot?
//
//  Created by Nicholas Miravich on 7/3/24.
//

import SwiftUI
import SwiftData

class CardViewModel: ObservableObject {
    @Published var topCardNames: [String] = []
    private let context: ModelContext
    
    init(context: ModelContext) {
        self.context = context
        fetchTopCardNames()
    }
    
    func fetchTopCardNames() {
        // Fetch all HistoryData records
        let fetchRequest = FetchRequest<HistoryData>(sortDescriptors: [])
        
        do {
            let historyDataRecords = try context.fetch(fetchRequest)
            
            // Count occurrences of each cardName
            var cardNameCounts = [String: Int]()
            
            for record in historyDataRecords {
                cardNameCounts[record.cardName, default: 0] += 1
            }
            
            // Sort counts in descending order
            let sortedCardNames = cardNameCounts.sorted { $0.value > $1.value }
            
            // Select top 3 counts including ties
            var topCardNames: [String] = []
            var currentRank = 0
            var lastCount: Int? = nil
            
            for (cardName, count) in sortedCardNames {
                if currentRank < 3 || count == lastCount {
                    topCardNames.append(cardName)
                    if count != lastCount {
                        currentRank += 1
                        lastCount = count
                    }
                } else {
                    break
                }
            }
            
            DispatchQueue.main.async {
                self.topCardNames = topCardNames
            }
            
        } catch {
            print("Failed to fetch history data: \(error)")
        }
    }
}

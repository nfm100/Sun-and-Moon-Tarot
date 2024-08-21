import SwiftUI

struct History: View {
    @EnvironmentObject var dataManager: DataManager
    @EnvironmentObject var decks: DeckHolder
    
    @State private var selectedFilter: String = "All"
    @State private var sortOrder: SortOrder = .newestFirst

    enum SortOrder {
        case newestFirst, oldestFirst
    }
    
    private var filterOptions: [String] {
        ["All"] + Set(dataManager.readings.map { $0.type }).sorted()
    }
    
    private var sortedAndFilteredReadings: [TarotReading] {
        let filteredReadings = selectedFilter == "All" ? dataManager.readings : dataManager.readings.filter { $0.type == selectedFilter }
        switch sortOrder {
        case .newestFirst:
            return filteredReadings.sorted { $0.date > $1.date }
        case .oldestFirst:
            return filteredReadings.sorted { $0.date < $1.date }
        }
    }
    
    private let typeDisplayNames: [String: String] = [
        "YesNo": "Yes or No?",
        "ThreeCards": "Past, Present, Future",
        // Add other type mappings here
    ]

    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(colors: [.purple, .indigo, .blue, .clear], startPoint: .top, endPoint: .bottomTrailing)
                    .ignoresSafeArea()
                VStack {
                    if sortedAndFilteredReadings.isEmpty {
                        Text("No readings available for the selected filter.")
                            .font(.title3)
                            .padding()
                            Spacer()
                    } else {
                        List {
                            ForEach(sortedAndFilteredReadings) { reading in
                                NavigationLink(destination: ReadingDetailView(reading: reading)) {
                                    HStack {
                                        VStack(alignment: .leading) {
                                            Text("Date: \(reading.date, formatter: DateFormatter.shortDate)")
                                                .font(.headline)
                                            Text("Reading: \(displayName(for: reading.type))")
                                                .font(.subheadline)
                                        }
                                    }
                                    .padding(.vertical, 5)
                                }
                                .foregroundColor(.black)
                                .listRowBackground(
                                    Capsule()
                                        .fill(Color(white: 1, opacity: 0.4))
                                        .padding(.vertical, 2)
                                        .padding(.horizontal, 4))
                                .listRowSeparator(.hidden)
                            }
                            .onDelete(perform: deleteReading)
                        }
                        .toolbarBackground(.ultraThinMaterial, for: .bottomBar)
                        .toolbarBackground(.ultraThinMaterial, for: .navigationBar)
                        .scrollContentBackground(.hidden)
                    }
                }
                .navigationBarTitle("History")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Menu {
                            ForEach(filterOptions, id: \.self) { option in
                                Button(action: {
                                    selectedFilter = option
                                }) {
                                    Text(displayName(for: option))
                                }
                            }
                        } label: {
                            Image(systemName: "line.3.horizontal.decrease.circle")
                                .foregroundStyle(.black)
                        }
                    }
                    ToolbarItem(placement: .topBarLeading) {
                        Menu {
                            Button(action: {
                                sortOrder = .newestFirst
                            }) {
                                HStack {
                                    Text("Newest First")
                                    if sortOrder == .newestFirst {
                                        Image(systemName: "checkmark")
                                    }
                                }
                            }
                            Button(action: {
                                sortOrder = .oldestFirst
                            }) {
                                HStack {
                                    Text("Oldest First")
                                    if sortOrder == .oldestFirst {
                                        Image(systemName: "checkmark")
                                    }
                                }
                            }
                        } label: {
                            Image(systemName: "arrow.up.arrow.down.circle")
                                .foregroundStyle(.black)
                        }
                    }
                }
            }
        }
    }
    
    private func displayName(for type: String) -> String {
        return typeDisplayNames[type] ?? type
    }
    
    private func deleteReading(at offsets: IndexSet) {
        offsets.forEach { index in
            let reading = sortedAndFilteredReadings[index]
            if let readingIndex = dataManager.readings.firstIndex(where: { $0.id == reading.id }) {
                dataManager.readings.remove(at: readingIndex)
            }
        }
    }
}

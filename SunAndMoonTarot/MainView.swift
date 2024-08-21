import SwiftUI
import SwiftData

struct MainView: View {
    @EnvironmentObject var decks: DeckHolder
    @EnvironmentObject var dataManager: DataManager
    

    var body: some View {
        TabView {
            Readings()
                .tabItem {
                    Label("Readings", systemImage: "sparkles")
                }
            History()
                .tabItem {
                    Label("History", systemImage: "book")
                }
            Decks()
                .tabItem {
                    Label("Decks", systemImage: "lanyardcard")
                }
            Settings()
                .tabItem {
                    Label("Settings", systemImage: "gearshape")
                }
        }
        .environmentObject(decks)
        .environmentObject(dataManager)
        .tint(.black)
        .toolbarBackground(.hidden, for: .tabBar)
        .onAppear {
            UITabBar.appearance().unselectedItemTintColor = .systemGray2
        }
        .background(LinearGradient(colors: [.purple, .indigo, .blue, .clear], startPoint: .top, endPoint: .bottomTrailing))
    }
}



struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        // Create mock instances of DeckHolder and DataManager for the preview
        let mockDecks = DeckHolder()
        let mockDataManager = DataManager()

        // Provide the environment objects to the preview
        MainView()
            .environmentObject(mockDecks)
            .environmentObject(mockDataManager)

            
    }
}

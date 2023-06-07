import SwiftUI

struct CollectionView: View {
    
    @StateObject private var vm = LogicaVM()
    
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Text("Игра")
                    Image(systemName: "gamecontroller.fill")
                }
            
            SecretView()
                .tabItem {
                    Label("Настройки", systemImage: "gearshape.fill")
                }
        }
        .environmentObject(vm)
    }
}

struct CollectionView_Previews: PreviewProvider {
    static var previews: some View {
        CollectionView()
            .environmentObject(LogicaVM())
    }
}

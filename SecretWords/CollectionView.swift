import SwiftUI

struct CollectionView: View {
    
    @StateObject private var vm = LogicaVM()
    @State private var sheetShow = false
    
    var body: some View {
        NavigationView {
            VStack {
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
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Image(systemName: "questionmark.circle.fill")
                        .foregroundColor(.accentColor)
                        .onTapGesture {
                            withAnimation{
                                sheetShow.toggle()
                            }
                        }
                        .sheet(isPresented: $sheetShow){
                            Spacer(minLength: 30)
                            ScrollView {
                                InstructionView()
                                    .padding()
                                    .presentationDetents([.height(200), .medium, .large])
                                    .presentationBackground(.indigo)
                                    .presentationCornerRadius(32)
                            }
                        }
                        .foregroundColor(.white)
                }
            }
        }
    }
}


struct CollectionView_Previews: PreviewProvider {
    static var previews: some View {
        CollectionView()
            .environmentObject(LogicaVM())
    }
}

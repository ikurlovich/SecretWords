import SwiftUI

struct HomeView: View {
    @EnvironmentObject private var vm: LogicaVM
    
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                RadialGradient(gradient: Gradient(colors: [.indigo, .black]), center: .center, startRadius: 20, endRadius: 600)
            }
            .ignoresSafeArea()
            
            VStack {
                VStack(spacing: 20) {
                    
                    Image(systemName: "magnifyingglass")
                        .font(.largeTitle)
                        .foregroundColor(.yellow)
                    
                    Text("Отгадай слово")
                        .multilineTextAlignment(.center)
                        .foregroundColor(.yellow)
                    
                    Text("Перебирайте слова в тематике: \n(\(vm.theme)) \nпока не откроете все загаданные слова")
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                        .padding(.horizontal, 5)
                }
                .foregroundColor(.secondary)
                .padding(.vertical, 20)
                .frame(width: 260)
                .background(.ultraThinMaterial)
                .cornerRadius(20)
                
                GroupBox {
                    HStack {
                        TextField("Поле ввода", text: $vm.text)
                        
                        if vm.accepted.map({ $0.lowercased() }).contains(vm.text.lowercased()) {
                            Image(systemName: "checkmark.circle").foregroundColor(.green)
                        }
                        
                        Button(action: { if vm.text != "" { vm.all.insert(vm.text) } }, label: { Text("Сохранить").foregroundColor(.indigo) })
                    }
                }
                .frame(width: 260)
                
                VStack(spacing: 20) {
                    if vm.accepted.map({ $0.lowercased() }).contains(vm.text.lowercased()) {
                        HStack {
                            Image(systemName: "dollarsign").foregroundColor(.green)
                            Image(systemName: "dollarsign").foregroundColor(.green)
                            Image(systemName: "dollarsign").foregroundColor(.green)
                        }
                    }
                    
                    Text("Найдено \(vm.all.count) слов из \(vm.accepted.count)")
                        .multilineTextAlignment(.center)
                        .foregroundColor(.yellow)
                    
                    if vm.all != [] {
                        Text($vm.all.wrappedValue.description)
                            .foregroundColor(.white)
                    }
                }
                .foregroundColor(.secondary)
                .padding(.vertical, 20)
                .frame(width: 260)
                .background(.ultraThinMaterial)
                .cornerRadius(20)
                
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(LogicaVM())
    }
}

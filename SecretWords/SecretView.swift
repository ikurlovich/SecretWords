import SwiftUI

struct SecretView: View {
    
    @EnvironmentObject private var vm: LogicaVM
    
    @State private var themeEnter = ""
    @State private var text2 = ""
    
    var body: some View {
        ZStack {
            
            VStack(spacing: 0) {
                
                RadialGradient(gradient: Gradient(colors: [.indigo, .black]), center: .center, startRadius: 20, endRadius: 600)
                
            }
            .ignoresSafeArea()
            
            VStack {
                
                VStack(spacing: 20) {
                    
                    Image(systemName: "gearshape")
                        .font(.largeTitle)
                        .foregroundColor(.yellow)
                    
                    Text("Инструкция к игре")
                        .multilineTextAlignment(.center)
                        .foregroundColor(.yellow)
                    
                    Text("1. Внесите название темы\n(\(vm.theme))\n2. Вносите и сохраняйте по одному слову-загадке\n\nЗагадано слов: \(vm.accepted.count)")
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                        .padding(.horizontal, 30)
                    
                }
                .foregroundColor(.secondary)
                .padding(.vertical, 20)
                .frame(width: 260)
                .background(.ultraThinMaterial)
                .cornerRadius(20)
                
                GroupBox {
                    
                    HStack {
                        
                        TextField("Тема", text: $themeEnter)
                        
                        Button(action: { if themeEnter != "" { vm.theme = themeEnter }; themeEnter = "" }, label: { Text("Сохранить").foregroundColor(.indigo) })
                        
                    }
                }
                .frame(width: 260)
                
                GroupBox {
                    
                    HStack {
                        
                        TextField("Слово", text: $text2)
                        
                        Button(action: { if text2 != "" { vm.accepted.append(text2) }; text2 = "" }, label: { Text("Сохранить").foregroundColor(.indigo) })
                        
                    }
                }
                .frame(width: 260)
                
                VStack(spacing: 5) {
                    
                    Text("Загаданные слова")
                        .multilineTextAlignment(.center)
                        .foregroundColor(.yellow)
                    
                    if vm.accepted != [] {
                        
                        ScrollView {
                            Text($vm.accepted.wrappedValue.description)
                                .multilineTextAlignment(.center)
                                .foregroundColor(.white)
                                .padding(.horizontal, 30)
                        } .frame(height: 100)
                        
                    } else {
                        Text("Слов пока нет")
                            .foregroundColor(.white)
                    }
                    
                    HStack {
                        
                        Button(action: { vm.accepted.removeAll() }, label: { Text("Удалить слова").foregroundColor(.yellow) })
                        
                        Button(action: { vm.theme = "пусто" }, label: { Text("Удалить тему").foregroundColor(.yellow) })
                        
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

struct SecretView_Previews: PreviewProvider {
    static var previews: some View {
        SecretView()
            .environmentObject(LogicaVM())
    }
}
